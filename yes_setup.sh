#!/usr/bin/env bash

export destination="/Users/$(whoami)/happy_halloween"
export output_file="output.log"

file_and_req_checks() {
    # check if the happy_halloween dir exists.
    if [ ! -d "$destination" ]; then
      create_dir_and_files
    else
      cd "$destination"
    fi

    # check if "pip" exists. If not, use "pip3" instead (or just kill the whole thing)
    if command -v pip > /dev/null; then
      pip_command="pip"
    elif command -v pip3 > /dev/null; then
      pip_command="pip3"
    else
      echo "Neither pip nor pip3 found." >> "$output_file"
      exit 1
    fi

    # check if the python packages are already installed
    packages_list=$($pip_command freeze)

    # Read each line from requirements.txt
    while read -r line; do
      # 'cut' will split by '=' and grab just the first part
      package_name=$(echo "$line" | cut -d'=' -f1)

      # is the package already installed?
      if ! echo "$packages_list" | grep -q "$package_name"; then
        $pip_command install -r requirements.txt || { echo "Could not install requirements." >> "$output_file"; exit 1; }
        # break the loop since we've already installed the packages
        break
      fi
    done < requirements.txt
}

create_dir_and_files() {
    # create the happy_halloween dir and cd to it. create the output file
      mkdir -p "$destination" || { echo "Dir not created." >> "$output_file"; exit 1; }
      cd "$destination" || { echo "Cannot move to dir." >> "$output_file"; exit 1; }
      touch output.log || { exit 1; }

    # download the files we'll need to run the script
      local urls=(
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yes1.mp3"
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yes2.mp3"
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yes3.mp3"
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/requirements.txt"
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yess_click.py"
        "https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yes_script.sh"
      )
      for url in "${urls[@]}"; do
        filename=$(basename "$url")
        curl -o "$destination/$filename" "$url" || { echo "Cannot download $url." >> "$output_file"; exit 1; }
      done

      # make yes_script.sh executable
      chmod +x yes_script.sh

      # check if shell script has extended attributes, and remove them
      if [ -n "yes_script.sh" ]; then
        xattr -c yes_script.sh
      fi
}

file_executable_check() {
    local file_path="./yess_click.py"

    if [ ! -x "$file_path" ]; then
      chmod +x "$file_path" || { echo "$file_path cannot be made executable." >> "$output_file"; exit 1; }
    fi
}

file_and_req_checks
file_executable_check