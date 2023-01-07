#!/bin/bash

# Check if the "quota" package is installed
if ! dpkg -s quota &> /dev/null; then
  echo "Error: Quota package is not installed."
  exit 1
fi

# Check if the filesystem is mounted with quota support
if ! mount | grep -q "usrquota"; then
  echo "Error: Filesystem is not mounted with quota support."
  exit 1
fi

# Check if the "usrquota" option is set in /etc/fstab
if ! grep -q "usrquota" /etc/fstab; then
  # Add the "usrquota" option to the relevant filesystem in /etc/fstab
  sed -i '/\<ext4\>/ s/defaults/defaults,usrquota/' /etc/fstab

  # Remount the filesystem to apply the changes
  mount -o remount "$(df -hT | grep '\<ext4\>' | awk '{print $7}')"
fi

# Check if the quota service is running
if ! systemctl is-active --quiet quota; then
  # Start the quota service
  systemctl start quota
fi

echo "User quotas are now enabled."
