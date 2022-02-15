#!/usr/bin/env bash

set -euo pipefail

if ! echo "aws azure kvm vmware mac" | grep -w -q ${1}; then
   echo Usage: "${0} aws|azure|kvm|vmware"
   exit 1
fi

IS_VERBOSE=$(jq 'if has("is_verbose") then .is_verbose else false end' "${1}"/config.json)
IS_MLOPS=$(jq 'if has("is_mlops") then .is_mlops else false end' "${1}"/config.json)
IS_MAPR=$(jq 'if has("is_mapr") then .is_mapr else false end' "${1}"/config.json)
IS_HA=$(jq 'if has("is_ha") then .is_ha else false end' "${1}"/config.json)
ADMIN_PASSWORD=$(jq '.admin_password' "${1}"/config.json)
