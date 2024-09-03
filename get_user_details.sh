#!/bin/bash
      username="$1"

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        exit 1
    fi
    echo "User Information for '$username':"
    id "$username"
    echo "Home Directory: $(getent passwd $username | cut -d: -f6)"
    echo "Login Shell: $(getent passwd $username | cut -d: -f7)"
    echo "Groups: $(groups $username)"

    chage -l "$username"

    lastlog -u "$username"
