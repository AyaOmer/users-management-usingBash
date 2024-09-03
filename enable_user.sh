#!/bin/bash
  
 username="$1"

    usermod -U "$username"
    echo "User $username enabled successfully."
