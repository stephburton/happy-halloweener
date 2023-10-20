#!/usr/bin/env bash

create_dir_and_files() {
    local destination="/Users/$(whoami)/happy_halloween"

    if [ ! -d "$destination" ]; then
      mkdir -p "$destination" || { echo "Dir not created." >> output.log; exit 1; }
      cd "$destination" || { echo "Cannot move to dir." >> output.log; exit 1; }

      local urls=(
        "https://github.com/stephburton/happy-halloweener/raw/main/yes1.mp3"
        "https://github.com/stephburton/happy-halloweener/raw/main/yes2.mp3"
        "https://github.com/stephburton/happy-halloweener/raw/main/yes3.mp3"
        "https://github.com/stephburton/happy-halloweener/raw/main/requirements.txt"
        "https://github.com/stephburton/happy-halloweener/raw/main/yess_click.py"
      )
      for url in "${urls[@]}"; do
        filename=$(basename "url")
        curl -o "$destination/$filename" "$url" || { echo "Cannot download $url." >> output.log; exit 1; }
      done
      touch output.log || { exit 1; }
    fi
}

file_executable_check() {
    local file_path="./yess_click.py"

    if [ ! -x "$file_path" ]; then
      chmod +x "$file_path" || { echo "$file_path cannot be made executable." >> output.log; exit 1; }
    fi
}

run_on_date() {
    local NOW=$(date "+%Y-%m-%d")

    if [[ "$NOW" == "2023-10-31" ]]; then
      nohup python3 yess_click.py > output.log 2>&1 &
    fi
}

create_dir_and_files
file_executable_check
run_on_date