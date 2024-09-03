#!/bin/bash

   username="$1"
      new_username="$2"
      commit="$3"
      new_shell="$4"
      new_home_dir="$5"
      new_groups="$6"

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        exit 1
    fi
    if [ -n "$new_username" ]; then
        usermod -l "$new_username" "$username"
        username="$new_username"
    fi
    if [ -n "$commit" ]; then
        usermod -c "$commit" "$username"

    fi
    if [ -n "$new_shell" ]; then
        usermod -s "$new_shell" "$username"

    fi
    if [ -n "$new_home_dir" ]; then
        usermod -m -d "$new_home_dir" "$username"

    fi

    if [ -n "$new_groups" ]; then
        usermod -G "$new_groups" "$username"

    fi

    echo "User $username modified successfully."
