#!/bin/bash

ROOT_DIR=$1

if [ -z "$ROOT_DIR" ]; then
    echo "Usage: $0 <root directory>"
    exit 1
fi

for dir in "$ROOT_DIR"/*; do
    if [ -d "$dir/.git" ]; then
        cd "$dir" || exit
        git add .
        git commit -m "script push" || echo "Nothing to commit in $dir"
        git push || { git pull --rebase && git push; }
        cd - >/dev/null || exit
    else
        echo "Not a Git repo: $dir"
    fi
done

echo "Done."

