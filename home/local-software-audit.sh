#!/usr/bin/env bash

if [ -f 'my_software.txt' ]; then
  rm 'my_software.txt'
fi

printf "Vanilla Brew\n" >> my_software.txt
printf "============\n\n" >> my_software.txt
brew list -1 --versions >> my_software.txt 

printf "\nBrew Cask\n" >> my_software.txt
printf "=========\n\n" >> my_software.txt
brew cask list -1 --versions >> my_software.txt

printf "\nApplications\n" >> my_software.txt
printf "============\n\n" >> my_software.txt
ls -1 /Applications >> my_software.txt

