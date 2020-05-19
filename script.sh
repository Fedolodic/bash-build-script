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

# Give user chance to exit script if they need
# to make a change to the version
echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"
else
  echo "Please come back when you are ready"
fi

# Copy every file from source/ to build/
# except for secretinfo.md
for filename in source/*
do
  # Check if filename is "source/secretinfo.md"
  if [ "$filename" == "source/secretinfo.md" ]
  then
    echo "Not copying" $filename
  else
    echo "Copying" $filename
    cp $filename build/.
  fi
done

# List files in the build/ directory for user
cd build/
pwd
echo "Build version $version contains:"
ls -alt
cd ..
