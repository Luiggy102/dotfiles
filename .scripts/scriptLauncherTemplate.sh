#!/bin/sh

choises="example"

chosen=$(echo "$choises" | fuzzel -d)

case "$chosen" in
    # example ) command ;;
esac
