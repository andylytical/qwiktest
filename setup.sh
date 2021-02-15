#!/bin/bash

###
# Fill in steps below to do the work of installing

# For more ideas and common actions, see also:
# - https://raw.githubusercontent.com/andylytical/git-config/master/setup.sh
# - https://raw.githubusercontent.com/ncsa/xcat-tools/master/setup.sh
###

BASE=$( dirname $0 )
TS=$(date +%s)

save_config_var() {
  set -x
  local _fn_conf="$TGT_DIR/.setup.cfg"
  local _key="$1"
  local _val="${!_key}"
  [[ -e "$_fn_conf" ]] || echo "# last update" > "$_fn_conf"
  sed -i -n -e "/last update/c# last update $TS" "$_fn_conf"
  cat "$_fn_conf"
  sed -i -n -e "/^${_key}=/!p" "$_fn_conf"
  cat "$_fn_conf"
  echo "${_key}=${_val}" >> "$_fn_conf"
  cat "$_fn_conf"
}

# Output from 'pwd' will be the directory from which quickstart was invoked
INSTALL_DIR="$(pwd)"
[[ -n "$QWIKTEST_INSTALL_DIR" ]] && INSTALL_DIR="$QWIKTEST_INSTALL_DIR"
TGT_DIR="$INSTALL_DIR/qwiktest"
mkdir -p "$TGT_DIR"

echo "Hello from '$BASE/setup.sh'"
echo "Install dir: '$INSTALL_DIR'"
echo "Target dir: '$TGT_DIR'"

testvarone=xy34t
save_config_var testvarone

GIT_BRANCH=$( git -C "${BASE}" branch | awk '/^\*/ {print $NF}' )
echo "Found GIT_BRANCH: $GIT_BRANCH"
save_config_var GIT_BRANCH

#GIT_URL=$( git -C "${BASE}" remote get-url origin )
GIT_URL=abcdefg
echo "Found GIT_URL: $GIT_URL"
save_config_var GIT_URL

cat "$TGT_DIR/.setup.cfg"

echo "Nothing else to do."
