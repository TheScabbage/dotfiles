#!/usr/bin/env sh

# Check for "nocheckin" in staged changes
if git diff --cached | grep -q "nocheckin"; then
    echo "Commit rejected: 'nocheckin' found in staged changes."
    exit 1
fi

exit 0
