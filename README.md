# Steph's Lame Halloween Prank

## Description
I'm currently learning Python, Bash scripting and how to create cronjobs. I created this little project as a fun Halloween prank to pull on my husband (who I'm sure will seek retribution, lol!).

The script will play one of three sound files every time it detects a mouse click. The script will continue running in the background, and will not end until the date conditional is no longer met. Unless you hit the `esc` key, of course (did you think I was that mean?).

### Note
Pulling off this prank will require access to another person's machine. DO NOT DO ANY OF THIS WITHOUT THEIR CONSENT!

## Usage
- You can download just the [yes_setup.sh](https://raw.githubusercontent.com/stephburton/happy-halloweener/main/yes_setup.sh), if you prefer. It will download all of the other files (with the exception of the license and the readme files) from my repo, once the script is running. This simplifies things for my purposes, but you can also just clone the repo if you prefer.
- On MacOS and Linux: Add cronjob using `crontab -e` and then add `0 0 31 10 * /path/to/yes_script.sh` (or another date, if you prefer)
  - On Windows: Set up the cronjob using Task Scheduler. [This guide](https://www.tomsguide.com/how-to/how-to-use-task-scheduler-on-windows) looks like it will give you some idea how to do this.
- On Mac OS, you will need to enable input monitoring (for both Python3 and ther Terminal application) for this to work. If this makes you uncomfortable, please do not proceed. If you choose to proceed, go to Systems Settings > Privacy & Security > Input Monitoring. Then ensure it's enabled for the "Terminal" application

## Contributing
Please feel free to open an issue if you see an opportunity for improvement. I'm learning and happy to have the feedback.

## Contact
Email me: steph@inf0rmav0re.com

## Acknowledgments
- This script uses sounds from freesound: "yes" MP3s originated from "yes.wav" by balloonhead ( https://freesound.org/s/364948/ ) licensed under CCBYNC 4.0
