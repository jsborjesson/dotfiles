#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.engelbart_option 1
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.engelbart_delete 1
/bin/echo -n .
$cli set remap.move_mouse_cursor_center_fn_alone 1
/bin/echo -n .
$cli set option.vimode_fn_hjkl 1
/bin/echo -n .
$cli set remap.engelbart_control 1
/bin/echo -n .
$cli set option.emacsmode_controlH 1
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
$cli set remap.simple_vi_mode 1
/bin/echo -n .
$cli set remap.engelbart_escape 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.controlJ2enter 1
/bin/echo -n .
$cli set remap.mouse_keys_mode_2 1
/bin/echo -n .
/bin/echo
