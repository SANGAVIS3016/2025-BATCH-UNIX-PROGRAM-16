#!/bin/bash

USERNAME="student_test"
GROUPNAME="test_group"

# User management commands
useradd "$USERNAME"
echo "$USERNAME:Password123!" | chpasswd

# Group management commands
groupadd "$GROUPNAME"
usermod -aG "$GROUPNAME" "$USERNAME"
groupdel "$GROUPNAME"

# User cleanup
userdel -r "$USERNAME"

echo "User and group management operations completed."
