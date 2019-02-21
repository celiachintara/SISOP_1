#!/bin/bash

PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
echo "$PASS" >> "password1.txt"
