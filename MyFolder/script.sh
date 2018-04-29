#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

foo | echo a
echo bar
read -p 'press Enter to exit'