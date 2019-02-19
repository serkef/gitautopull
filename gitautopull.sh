#!/bin/bash

git_dir="$HOME/gh"
filename=".autopull"
while read -r line; do
    cd "$git_dir/$line"
    echo "Starting git pull for repo: $line"
    echo "Current branch: $(git branch | grep \* | cut -d ' ' -f2)"
    git pull --rebase
    echo ""
done < "$git_dir/$filename"
