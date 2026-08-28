# AI Slop Split Thumb Keyboard

![Split thumb keyboard running in Steam Deck Desktop Mode](assets/split-thumb-keyboard.png)

This repository is the reproducible source for the locally installed theme. It
preserves the final accepted state:

- smaller keys split into left and right clusters;
- a real center gap created with flexbox auto margins;
- visually even horizontal and vertical spacing between painted key faces;
- untouched nested button icons;
- Steam's native vertical position and unobstructed bottom menu bar.

## Reinstall

Install Decky Loader and CSS Loader first, then run:

```bash
cd /home/deck/Split-Thumb-Keyboard
./install.sh
```

The script installs and enables the CSS Loader theme without modifying Steam or
CSS Loader code.

In CSS Loader, keep **Standalone Backend** enabled for Desktop Mode. If Decky
cannot be restarted automatically, restart Steam or Decky once after installing.

## Locations

- `theme/` — complete CSS Loader theme and activation files.
- `install.sh` — idempotent local installer.

The installed working copy remains at
`/home/deck/homebrew/themes/Split Thumb Keyboard`.
