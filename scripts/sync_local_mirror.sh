#!/bin/bash

# MIT License

# Copyright (c) 2019-2024 Andrew Clemons

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -e

version="$1"

if [[ -z "$version" ]] ; then
  echo "version?"
  exit 1
fi

base_dir="slackware"

if printf '%s\n' "$version" | grep -E 'slackwareaarch64|slackwarearm' >/dev/null 2>&1 ; then
  base_dir="slackwarearm"
fi

mkdir -p "local_mirrors/$version"
rsync --delete -rlptD --delete-excluded --bwlimit 0 --exclude pasture --exclude source "slackware.uk::$base_dir/$version/" "local_mirrors/$version"
