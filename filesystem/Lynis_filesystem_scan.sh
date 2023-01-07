#!/bin/bash

# Check if the "lynis" package is installed
if ! dpkg -s lynis &> /dev/null; then
  echo "Error: Lynis package is not installed."
  exit 1
fi

# Run Lynis and generate a report
lynis audit system --report-file /tmp/lynis_report.txt

# Check if the report contains any warnings or errors
if grep -q "Warnings found" /tmp/lynis_report.txt || grep -q "Errors found" /tmp/lynis_report.txt; then
  # Print the report
  cat /tmp/lynis_report.txt

  # Send an email alert with the report attached
  mail -a /tmp/lynis_report.txt -s "Lynis Report" admin@example.com <<EOF
  Lynis has identified potential security weaknesses in the system. Please review the attached report.
EOF
fi

# Remove the report
rm /tmp/lynis_report.txt
