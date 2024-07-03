#!/bin/zsh

video4telegram() {
  # Define color codes
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  NC='\033[0m' # No Color

  # Prompt the user to enter the name of the video file with color
  echo -e "${GREEN}Enter the video file name: ${NC}"
  videoName=""
  vared -c videoName

  # Prompt the user to enter the start time for the video clip with color
  echo -e "${GREEN}Enter the start time of the video fragment (e.g., 00:00:00): ${NC}"
  startTime=""
  vared -c startTime
  # Set a default start time if none is provided
  if [ -z "$startTime" ]; then
    startTime="00:00:00"
  fi

  # Prompt the user to enter the end time for the video clip with color
  echo -e "${GREEN}Enter the end time of the video fragment (e.g., 00:05:00): ${NC}"
  endTime=""
  vared -c endTime

  # Provide information about CRF values before asking for input, with colors
  echo -e "${YELLOW}The CRF value can range from 0 to 51:${NC}"
  echo -e "${YELLOW}0${NC}: Lossless compression. This will produce the highest quality and largest file size."
  echo -e "${YELLOW}18${NC}: Visually lossless. This is generally considered a good choice for high-quality video where the difference from the source is nearly imperceptible."
  echo -e "${YELLOW}23${NC}: Default value. This is a good balance between quality and file size."
  echo -e "${YELLOW}51${NC}: Lowest quality. This will produce the smallest file size but significantly reduces quality."

  # Prompt the user to enter a CRF value for video compression with color
  echo -e "${GREEN}Enter the CRF parameter (leave empty to skip): ${NC}"
  crf=""
  vared -c crf

  # Prompt the user to enter a desired name for the output file with color
  echo -e "${GREEN}Enter the desired output file name (without extension): ${NC}"
  outputName=""
  vared -c outputName
  # Determine the output file name based on user input or defaults
  if [ -z "$outputName" ]; then
    if [ -z "$crf" ]; then
      outputName="${videoName%.*}_telegram"
    else
      outputName="${videoName%.*}_telegram_${crf}"
    fi
  fi

  # Construct the ffmpeg command with the provided parameters
  finalCommand="ffmpeg -hide_banner -loglevel error -i \"$videoName\""
  if [ -n "$startTime" ]; then
    finalCommand+=" -ss \"$startTime\""
  fi
  if [ -n "$endTime" ]; then
    finalCommand+=" -to \"$endTime\""
  fi
  finalCommand+=" -c:v libx264"
  if [ -n "$crf" ]; then
    finalCommand+=" -crf \"$crf\""
  fi
  finalCommand+=" \"${outputName}.mp4\""

  # Echo the final command to the user before execution with color
  echo -e "${YELLOW}Executing command: $finalCommand${NC}"

  # Execute the ffmpeg command
  eval $finalCommand
  # Notify the user upon successful completion with color
  echo -e "${GREEN}Video processed: ${outputName}.mp4${NC}"
}
