#!/bin/bash

      groupname="$1"
      groupid="$2"
      users="$3"
    if getent group "$groupname" &>/dev/null; then
        echo "Group '$groupname' already exists."
        exit 1
    fi
    if [ -n "$groupid" ]; then
        groupadd -g "$groupid" "$groupname"
    else
        groupadd "$groupname"

    fi
    echo "Group '$groupname' has been created successfully."

    if [ -n "$users" ]; then
        for user in ${users//,/ }; do
            if id "$user" &>/dev/null; then
                usermod -aG "$groupname" "$user"
                echo "User '$user' has been added to group '$groupname'."
            else
                echo "User '$user' does not exist."
            fi

        done
    fi
