#!/bin/bash

# Check all users' passwords for strength
for user in $(cut -d: -f1 /etc/passwd); do
  # Check the password for strength
  if ! grep -qP '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})' <(grep "^$user:" /etc/shadow); then
    # If the password is not strong, force the user to change it
    chage -d 0 "$user"
  fi
done
