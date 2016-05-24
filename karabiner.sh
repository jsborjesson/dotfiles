#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.custom_ergonomic_modifiers 1
/bin/echo -n .
$cli set remap.custom_ergonomic_fringe_keys 1
/bin/echo -n .
$cli set remap.move_mouse_cursor_center_fn_alone 1
/bin/echo -n .
$cli set option.vimode_fn_hjkl 1
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
$cli set remap.custom_fn_shift_numbers 1
/bin/echo -n .
$cli set remap.mouse_keys_mode_2 1
/bin/echo -n .
$cli set remap.custom_fn_characters 1
/bin/echo -n .
/bin/echo
