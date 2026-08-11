#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
theme_source="${repo_dir}/theme"
theme_target="/home/deck/homebrew/themes/Split Thumb Keyboard"
plugin_dir="/home/deck/homebrew/plugins/SDH-CssLoader"
plugin_target="${plugin_dir}/css_browserhook.py"
plugin_snapshot="${repo_dir}/extras/css-loader-v2.1.2/css_browserhook.py"
apply_loader_patch=1

if [[ "${1:-}" == "--theme-only" ]]; then
  apply_loader_patch=0
elif [[ $# -gt 0 ]]; then
  echo "Usage: $0 [--theme-only]" >&2
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

if [[ ${apply_loader_patch} -eq 1 ]]; then
  if [[ ! -f "${plugin_dir}/package.json" || ! -f "${plugin_target}" ]]; then
    echo "CSS Loader is not installed; skipped its optional reliability snapshot."
  else
    installed_version="$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "${plugin_dir}/package.json" | head -n 1)"
    if [[ "${installed_version}" != "2.1.2" ]]; then
      echo "CSS Loader ${installed_version:-unknown} is not 2.1.2; left its code untouched."
    elif cmp -s -- "${plugin_snapshot}" "${plugin_target}"; then
      echo "CSS Loader reliability snapshot is already installed."
    else
      backup_target="${plugin_target}.before-split-thumb-keyboard"
      if [[ ! -e "${backup_target}" ]]; then
        pkexec /usr/bin/cp -a -- "${plugin_target}" "${backup_target}"
      fi
      pkexec /usr/bin/install -m 0644 -- "${plugin_snapshot}" "${plugin_target}"
      pkexec /usr/bin/chown nobody:nobody -- "${plugin_target}"
      echo "Installed the CSS Loader 2.1.2 reliability snapshot."
    fi
  fi
fi

if systemctl restart plugin_loader; then
  echo "Restarted Decky Loader."
else
  echo "Could not restart Decky automatically; restart Decky or Steam once."
fi

echo "For Desktop Mode, confirm CSS Loader's Standalone Backend is enabled."
