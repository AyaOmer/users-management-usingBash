#!/bin/bash

      groupname="$1"
      new_groupname="$2"
      new_gid="$3"
      add_users="$4"
      remove_users="$5"
    if ! getent group "$groupname" &>/dev/null; then
        echo "Group '$groupname' does not exist."
        exit 1
    fi
    if [ -n "$new_groupname" ]; then
        groupmod -n "$new_groupname" "$groupname"
        groupname="$new_groupname"

    fi
    if [ -n "$new_gid" ]; then
        groupmod -g "$new_gid" "$groupname"
    fi

   

    if [ -n "$add_users" ]; then
        for user in ${add_users//,/ }; do
            if id "$user" &>/dev/null; then
                usermod -aG "$groupname" "$user"
                echo "User '$user' has been added to group '$groupname'."
            else
                echo "User '$user' does not exist."
            fi

        done
    fi

    if [ -n "$remove_users" ]; then
        for user in ${remove_users//,/ }; do
            if id "$user" &>/dev/null; then
                gpasswd -d "$user" "$groupname"
                echo "User '$user' has been removed from group '$groupname'."
            else
                echo "User '$user' does not exist."
            fi
        done
    fi
