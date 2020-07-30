#!/usr/bin/env sh

# MIT License (Expat License)
#
# Copyright (c) 2020 Adam Ward
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Config
LOGFILE="$HOME/.remote_ip.log"

# Regex found on StackOverflow. Can't find it anymore to source.
CURRENT_IP=$(curl -sL "https://httpbin.org/ip" | grep -o '"origin": "[^"]*' | grep -o '[^"]*$')

# Make sure file exists
touch $LOGFILE

# Started from the bottom, now we're here
LATEST_IP=$(tail -n 1 $LOGFILE | awk '{print $2}')

if [[ ! -z "$CURRENT_IP" ]]; then
  if [[ "$CURRENT_IP" != "$LATEST_IP" ]]; then
    echo "$(date +'%Y-%m-%dT%H:%M:%S%Z')    $CURRENT_IP" | tee -a $LOGFILE
  fi
fi
