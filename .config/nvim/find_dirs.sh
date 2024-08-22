#!/usr/bin/env bash
git status > /dev/null && git ls-files | xargs -n1 dirname | sort | uniq || find . -type d
