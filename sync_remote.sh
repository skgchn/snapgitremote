#!/bin/sh

# Idea: https://www.w3docs.com/snippets/git/how-to-fetch-all-git-branches.html

git fetch --prune --all 

git branch -r |\
    grep -v '\->' |\
    while read remote; do
        if [[ -z $(git branch --list ${remote#origin/}) ]]; then
            git branch --track "${remote#origin/}" "$remote"
        else
            echo "Notice: Branch named '${remote#origin/}' already exists."
        fi
    done

git pull --all
