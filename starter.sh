#!/bin/bash

USERNAME="student_test"
GROUPNAME="test_group"

# User management commands
sudo useradd "$USERNAME"
echo "$USERNAME:Password123!" | sudo chpasswd

# Group management commands
sudo groupadd "$GROUPNAME"
sudo usermod -aG "$GROUPNAME" "$USERNAME"

echo "User and group management operations completed."
