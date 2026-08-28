#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
theme_source="${repo_dir}/theme"
theme_target="/home/deck/homebrew/themes/Split Thumb Keyboard"

if [[ $# -gt 0 ]]; then
  echo "Usage: $0" >&2
  exit 2
fi

mkdir -p -- "${theme_target}"
install -m 0644 -- \
  "${theme_source}/shared.css" \
  "${theme_source}/theme.json" \
  "${theme_source}/config_ROOT.json" \
  "${theme_source}/config_USER.json" \
  "${theme_source}/README.md" \
  "${theme_target}/"
echo "Installed and enabled Split Thumb Keyboard."

if systemctl restart plugin_loader; then
  echo "Restarted Decky Loader."
else
  echo "Could not restart Decky automatically; restart Decky or Steam once."
fi

echo "For Desktop Mode, confirm CSS Loader's Standalone Backend is enabled."
