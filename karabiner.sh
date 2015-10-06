#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_controlH 1
/bin/echo -n .
$cli set repeat.wait 25
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.controlJ2enter 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.commandR2commandR_enter 1
/bin/echo -n .
$cli set remap.engelbart_escape 1
/bin/echo -n .
/bin/echo
