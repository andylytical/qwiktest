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
  local _fn_conf="$INSTALL_DIR/.setup.cfg"
  local _key="$1"
  local _val="${!_key}"
  [[ -e "$_fn_conf" ]] || echo "# last update" > "$_fn_conf"
  sed -i -n -e "/last update/c# last update $TS" "$_fn_conf"
  sed -i -n -e "/^$_key=/!p" -e "\$a$_key=$_val" "$_fn_conf"
}

# Output from 'pwd' will be the directory from which quickstart was invoked
INSTALL_DIR="$(pwd)"
[[ -n "$QWIKTEST_INSTALL_DIR" ]] && INSTALL_DIR="$QWIKTEST_INSTALL_DIR"

echo "Hello from '$BASE/setup.sh'"
echo "Install dir: '$INSTALL_DIR'"

GIT_URL=$( git -C "${BASE}" remote get-url origin )
save_config_var GIT_URL
GIT_BRANCH=$( git -C "${BASE}" branch | awk '/^\*/ {print $NF}' )
save_config_var GIT_BRANCH

cat "$INSTALL_DIR/.setup.cfg"

echo "Nothing else to do."
