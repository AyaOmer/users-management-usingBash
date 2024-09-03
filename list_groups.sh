#!/bin/bash
 echo "List of all groups:"
    cat /etc/group | cut -d: -f1
