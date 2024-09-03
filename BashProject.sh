#!/bin/bash

about() {
    echo "This is a Bash script that provides a user management system."
    echo "It allows you to perform the following operations:"
    echo "- Add, modify, and delete users"
    echo "- Add, modify, and delete groups"
    echo "- List all users and groups"
    echo "- Disable and enable user accounts"
    echo "- Change a user's password"
    echo ""
    echo "This script was created by Aya Omar Mossa (eng.ayaomar00@gmail.com)."
}

PS3='Please enter your choice: '
select choice in "Add User" "Modify User" "User details" "Delete User" "List Users" "Add Group" "Modify Group" "Delete Group" "List Groups" "Disable User" "Enable User" "Change Password" "About" "Exit"; do

    case "$choice" in
    "Add User")

        read -p "Enter the user name: " user
        read -p "Enter the user id or (leave blank for default): " uid
        read -p "Enter the user groups or (leave blank for default): " group

        ./add_user "$user" "$uid" "$group"
        ;;
    "Modify User")
        read -p "Enter the user name: " user
        read -p "Enter the new username (leave blank to keep current): " new_username
        read -p "Enter the descriptons : " desc
        read -p "Enter the new login shell (leave blank to keep current): " new_shell
        read -p "Enter the new home directory (leave blank to keep current): " new_home_dir
        read -p "Enter the new groups (comma-separated, leave blank to keep current): " new_groups

        ./modify_user "$user" "$new_username" "$desc" "$new_shell" "$new_home_dir" "$new_groups"
        ;;
    "User details")

        read -p "Enter the username to get details: " username

        ./get_user_details "$username"
        ;;
    "Delete User")
        read -p "Enter the username to delete: " username
        read -p "Enter (y) to delete the home directory or (n): " y
        ./delete_user "$username" "$y"
        ;;
    "List Users")
        ./list_users
        ;;
    "Add Group")
        read -p "Enter the group name to add: " groupname
        read -p "Enter the group Id to add (leave blank for none) : " groupId
        read -p "Enter the users to add to the group (comma-separated, leave blank for none): " users
        ./add_group "$groupname" "$groupId" "$users"
        ;;
    "Modify Group")
        read -p "Enter the current group name: " groupname
        read -p "Enter the new group name (leave blank to keep current): " new_groupname
        read -p "Enter the new group ID (leave blank to keep current): " new_gid
        read -p "Enter the users to add to the group (comma-separated, leave blank for none): " add_users
        read -p "Enter the users to remove from the group (comma-separated, leave blank for none): " remove_users
        ./modify_group "$groupname" "$new_groupname" "$new_gid" "$add_users" "$remove_users"
        ;;
    "Delete Group")
        read -p "Enter the group name to delete: " groupname
        
        ./delete_group "$groupname" 
        ;;
    "List Groups")
        ./list_groups
        ;;

    "Disable User")
        read -p "Enter the username to disable: " user
        ./disable_user "$user"
        ;;

    "Enable User")
        read -p "Enter the username to enable: " user
        ./enable_user "$user"
        ;;
    "Change Password")
        read -p "Enter the username: " user
        ./change_password "$user"

        ;;
    "About")
        about
        ;;
    "Exit")
        echo "Exiting..." && exit 1
        ;;

    esac

done
