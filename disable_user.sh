#!/bin/bash
      username="$1"

    usermod -L "$username"
    echo "User $username disabled successfully."
