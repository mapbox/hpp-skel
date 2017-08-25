#!/usr/bin/env bash

set -eu

# First create new repo on GitHub
# Then run "./scripts/liftoff.sh" from within your local hpp-skel root directory

echo "What is the name of your new project? "
read name
echo "What is the remote repo url for your new project? "
read url

mv ../hpp-skel $name
rm -rf .git
git init

git add .
git commit -m "here we go"
git remote add origin $url
git push -u origin master

# Perhaps useful for fresh start
# rm -rf include/hello_world
# rm -rf include/hello_world.hpp
# cp /dev/null CHANGELOG.md
# cp /dev/null README.md