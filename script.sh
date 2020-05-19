#!/bin/bash
echo "Welcome to Fedolodic's build script"
echo "🚀🚀🚀 Beginning build! 🚀🚀🚀"

# Get the first line of the changelog.md file.
# By default head returns 10 lines. So, we use
# -n argument to specify number of lines
firstline=$(head -n 1 source/changelog.md)

# Split firstline string into an array
read -a splitfirstline <<< $firstline

# Get value of script version
version=${splitfirstline[1]}
echo "You are building version" $version
