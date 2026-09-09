#!/bin/bash

USERNAME="student_test"
GROUPNAME="test_group"

# 1. User Management Commands
useradd "$USERNAME"
echo "$USERNAME:Password123!" | chpasswd

# 2. Group Management Commands
groupadd "$GROUPNAME"
usermod -aG "$GROUPNAME" "$USERNAME"
groupdel "$GROUPNAME"

# 3. Clean up user
userdel -r "$USERNAME"

echo "User and group management operations completed."
