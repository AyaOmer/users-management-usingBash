#!/bin/bash
group_name="$1" 
if ! getent group "$group_name" > /dev/null 2>&1; then
    echo "Group '$group_name' does not exist."
    exit 1
fi    
groupdel "$group_name"
echo "Group '$group_name' deleted successfully."
