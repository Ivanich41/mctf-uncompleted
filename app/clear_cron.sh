#!/bin/bash
# Removes the las line of target file if it isn't equal #
target_file='/var/spool/cron/crontabs/cronuser'
symbol=$(tail --lines 1 $target_file | cut -c 1)
if [[ $symbol != "#" ]]
then
        sed -i '$ d' $target_file
fi
