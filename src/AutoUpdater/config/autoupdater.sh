#!/bin/sh

APP_PATH="/opt/HelloWorld/maintenancetool"
SCRIPT_PATH=$(cd $(dirname $0) && pwd)/controlscript.qs

# アップデート確認
$APP_PATH --checkupdates

if test $? -eq 0
then
echo アップデートあり
$APP_PATH --updater --script $SCRIPT_PATH
else
echo アップデートなし
fi

