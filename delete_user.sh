#!/bin/bash


      username="$1"
      y="$2"

    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        exit 1
    fi
    if [ "$y" = "y" ]; then
       userdel -r -f "$username"
    else
        userdel "$username"

    fi
    echo "User $username deleted successfully."
