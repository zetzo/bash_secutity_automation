#!/bin/bash

# Check if the "aide" package is installed
if ! dpkg -s aide &> /dev/null; then
  echo "Error: AIDE package is not installed."
  exit 1
fi

# Initialize the AIDE database if it does not exist
if [ ! -f "/var/lib/aide/aide.db.gz" ]; then
  aide --init
fi

# Run a filesystem check and generate a report
aide --check > /tmp/aide_report.txt

# Check if the report contains any changes or errors
if grep -q "Added: " /tmp/aide_report.txt || grep -q "Removed: " /tmp/aide_report.txt || grep -q "Changed: " /tmp/aide_report.txt || grep -q "ERROR" /tmp/aide_report.txt; then
  # Print the report
  cat /tmp/aide_report.txt

  # Send an email alert with the report attached
  mail -a /tmp/aide_report.txt -s "AIDE Report" admin@example.com <<EOF
  AIDE has detected changes or errors in the filesystem. Please review the attached report.
EOF
fi

# Remove the report
rm /tmp/aide_report.txt
