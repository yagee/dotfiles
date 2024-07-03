# My dotfiles

This repository holds my personal dotfiles collection to simplify setting up and configuring macOS to my preferences. It's a toolkit for easy and efficient setup when reinstalling macOS or refining my current setup.

## macOS Setup One-liner

To quickly set up my macOS environment, I use this one-liner. It clones this repository, changes the directory to the dotfiles folder, makes the macOS setup script executable, and runs it to apply my preferred system configurations.

```sh
git clone git@github.com:yagee/dotfiles.git && cd dotfiles && chmod +x macOS.sh && ./macos.sh
```

## Scripts Directory

The `scripts/` directory contains utility scripts for making adjustments and enhancements to my system. These scripts cover various functionalities, from system tweaks to productivity improvements, and can be used independently of the main setup script.

### video4telegram Script

A notable script in my collection is `video4telegram.sh`. I created it to optimize videos for sharing on Telegram, making it easy to adjust video quality, trim footage, and set specific start and end times via a simple command-line interface. To use this script, I navigate to the `scripts/` directory and execute:

```sh
./video4telegram.sh
```

The script prompts me to input the video file and my preferences for start and end times, among other options. It then processes the video and saves it with a filename ready for sharing on Telegram.

This repository is my go-to resource for setting up and personalizing my macOS environment. It's always evolving as I discover new tweaks and tools, and I welcome any suggestions for improvements!
