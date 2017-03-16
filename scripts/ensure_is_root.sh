#!/bin/sh

set -e
set -u

if [ "$(id -u)" != "0" ]; then 
	echo "This must be run as root" 1>&2
	exit 1
fi            
