# Split Thumb Keyboard

This local CSS Loader theme separates the Steam virtual keyboard into left and
right thumb clusters. It affects the standard keyboard layout in Game Mode and,
when CSS Loader's standalone backend is enabled, the Steam keyboard in Desktop
Mode.

## Enable it

1. Install Decky Loader and its CSS Loader plugin if they are not installed.
2. In CSS Loader, choose **Refresh themes**.
3. Enable **Split Thumb Keyboard**.
4. For Desktop Mode, enable CSS Loader's **Standalone Backend** setting.

## Tuning

The split is created by fixed key widths plus `margin-left: auto` on the first
key in each right-hand cluster. In `shared.css`, adjust
`--split-thumb-key-width` for ordinary keys and the neighboring named width
variables for Tab, Caps Lock, Shift, Enter, and Backspace. The remaining row
width automatically becomes the center gap.

Keys have 1 px padding on each edge, producing a measured 2 px gap between
their painted faces horizontally and vertically. Desktop Mode retains Steam's
native keyboard position so its bottom menu bar remains unobstructed.

Disable the theme to restore the stock layout. The theme itself does not
replace Steam UI files; the local CSS Loader reliability patch may need to be
reapplied if CSS Loader is updated.
