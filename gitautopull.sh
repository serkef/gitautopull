#!/bin/bash

git_dir="$HOME/gh"
filename=".autopull"
while read -r line; do
    if [ -d $git_dir/$line ]; then
	cd "$git_dir/$line"
	echo "Starting git pull for repo: $line"
	echo "Current branch: $(git branch | grep \* | cut -d ' ' -f2)"
	git pull --rebase
	echo ""
    else
	cd $git_dir
	repo="git@github.com:blacklane/$line.git"
	echo "Starting git clone for repo: $line assuming $repo"
	git clone $repo
	echo ""
    fi
done < "$git_dir/$filename"
