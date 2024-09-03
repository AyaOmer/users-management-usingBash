#!/bin/bash
   username="$1"
       userid="$2"
       group="$3"

    echo "$username"

    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        exit 1

    fi
    if [ -n "$userid" ] && [ -z "$group" ]; then

        adduser -u "$userid" "$username"

    elif [ -z "$userid" ] && [ -n "$group" ]; then

        adduser -G "$group" "$username"
    elif [ -n "$userid" ] && [ -n "$group" ]; then

        adduser -G "$group" -u "$userid" "$username"
    else
        adduser "$username"
    fi

    passwd "$username"
    echo "User $username added successfully."
