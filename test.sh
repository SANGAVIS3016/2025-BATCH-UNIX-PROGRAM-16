#!/bin/bash

GROUP_NAME="developers"
USER1="student1"
USER2="student2"

echo "=================================="
echo "Running Group Management Tests"
echo "=================================="

# Clean previous test environment
sudo groupdel "$GROUP_NAME" 2>/dev/null || true
sudo userdel "$USER1" 2>/dev/null || true
sudo userdel "$USER2" 2>/dev/null || true

# Create test users
sudo useradd "$USER1"
sudo useradd "$USER2"

echo "Test users created."

# Check groupadd command
if ! grep -Eq '(^|[[:space:];&|])groupadd([[:space:]]|$)' starter.sh; then
    echo "FAIL: groupadd command not found."
    exit 1
fi

echo "PASS: groupadd command found."

# Check usermod command
if ! grep -Eq '(^|[[:space:];&|])usermod([[:space:]]|$)' starter.sh; then
    echo "FAIL: usermod command not found."
    exit 1
fi

echo "PASS: usermod command found."

# Run student program
echo "Executing starter.sh..."
sudo bash starter.sh

# Check group
if ! getent group "$GROUP_NAME" > /dev/null 2>&1; then
    echo "FAIL: Required group was not created."
    exit 1
fi

echo "PASS: Group created successfully."

# Check USER1 membership
if id -nG "$USER1" | tr ' ' '\n' | grep -qx "$GROUP_NAME"; then
    echo "PASS: $USER1 assigned to group."
else
    echo "FAIL: $USER1 was not assigned to group."
    exit 1
fi

# Check USER2 membership
if id -nG "$USER2" | tr ' ' '\n' | grep -qx "$GROUP_NAME"; then
    echo "PASS: $USER2 assigned to group."
else
    echo "FAIL: $USER2 was not assigned to group."
    exit 1
fi

# Cleanup
sudo groupdel "$GROUP_NAME" 2>/dev/null || true
sudo userdel "$USER1" 2>/dev/null || true
sudo userdel "$USER2" 2>/dev/null || true

echo "=================================="
echo "ALL TESTS PASSED!"
echo "=================================="

exit 0
