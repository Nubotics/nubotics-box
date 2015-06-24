#!/bin/bash

BASE_FOLDER="/var/tmp/windows-path-limit-fix/"

create()
{
    # Generate a unique but predictable directory by hashing the folder mount point
    # From http://stackoverflow.com/a/1602389
    name=`echo $1 | md5sum | cut -f1 -d" "`
    destination="$BASE_FOLDER$name"

    # Skip setup if the folder already exists
    if [ ! -d "$destination" ]; then

        echo "Creating mount destination: $destination"
        eval "mkdir -p $destination"
        eval "chown -R www-data:www-data $destination"
        eval "chmod 775 $destination"

    fi

    if [ -d "$1" ]; then

        echo "Transferring files from $1 to $destination"
        rsync -Lr --inplace $1/ $destination/

    else

        echo "Creating mount target: $1"
        eval "mkdir -p $1"

    fi

    echo "mounting $destination at $1"
    eval "mount -o bind $destination $1"

}

if [ ! "$1" -o -z "$1" ]; then
    echo "You must specify a folder mount point (recommend an absolute path)"
else
    create $1
fi