#!/usr/bin/env bash

# First create new repo on GitHub
# Then run the following script from within local hpp-skel directory:
#
# liftoff.sh --name <new-name> --url <new-remote-repo-url> 
#

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