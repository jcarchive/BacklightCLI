#! /bin/bash

device=/sys/class/backlight/intel_backlight/brightness
up=1
step=1000
 
while [[ $# -gt 0 ]]; do
  key=$1
  case $key in
    -d|--device)
      device=$2
      #TODO verify device existence
      shift
      shift
      ;;
    -u|--up)
      up=1
      shift
      ;;
    -w|--down)
      up=0
      shift
      ;;
    -s|--step)
      step=$2
      shift
      shift
      ;;
  esac
done

if [[ $up -eq 1 ]]; then
  value=$(($(cat $device)+$step))
else 
  value=$(($(cat $device)-$step))
fi

echo $value > $device
