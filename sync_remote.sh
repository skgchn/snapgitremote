#!/bin/sh

# Idea: https://www.w3docs.com/snippets/git/how-to-fetch-all-git-branches.html

git fetch --all

git branch -r |\
    grep -v '\->' |\
    while read remote; do
        git branch --track "${remote#origin/}" "$remote";
    done

git pull -all
