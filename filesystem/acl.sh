#!/bin/bash

# Check if the "acl" package is installed
if ! dpkg -s acl &> /dev/null; then
  echo "Error: ACL package is not installed."
  exit 1
fi

# Check if the filesystem is mounted with ACL support
if ! mount | grep -q "acl"; then
  echo "Error: Filesystem is not mounted with ACL support."
  exit 1
fi

# Check if the "acl" option is set in /etc/fstab
if ! grep -q "acl" /etc/fstab; then
  # Add the "acl" option to the relevant filesystem in /etc/fstab
  sed -i '/\<ext4\>/ s/defaults/defaults,acl/' /etc/fstab

  # Remount the filesystem to apply the changes
  mount -o remount "$(df -hT | grep '\<ext4\>' | awk '{print $7}')"
fi

# Check if the "acl" module is loaded
if ! lsmod | grep -q "acl"; then
  # Load the "acl" module
  modprobe acl
fi

echo "ACLs are now enabled."
