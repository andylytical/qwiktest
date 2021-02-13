#!/bin/bash

###
# Fill in steps below to do the work of installing

# For more ideas and common actions, see also:
# - https://raw.githubusercontent.com/andylytical/git-config/master/setup.sh
# - https://raw.githubusercontent.com/ncsa/xcat-tools/master/setup.sh
###

BASE=$( dirname $0 )
TS=$(date +%s)

# Output from 'pwd' will be the directory from which quickstart was invoked
INSTALL_DIR="$(pwd)"

echo "Hello from '$BASE/setup.sh'"
echo "Install dir: '$INSTALL_DIR'"

set -x
git -C "${BASE}" remote -v
git -C "${BASE}" branch


echo "Nothing else to do."
