#!/bin/bash

GROUP_NAME="developers"
USER1="student1"
USER2="student2"

# Create the group
groupadd "$GROUP_NAME"

# Add both users to the group
usermod -aG "$GROUP_NAME" "$USER1"
usermod -aG "$GROUP_NAME" "$USER2"

echo "User and group management operations completed."
