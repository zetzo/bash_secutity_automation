acl.sh

This script first checks if the acl package is installed and if the filesystem is mounted with ACL support. If either of these checks fail, it exits with an error message.

If the acl package is installed and the filesystem is mounted with ACL support, it checks if the acl option is set in the /etc/fstab file. If it is not set, it adds the acl option to the relevant filesystem in /etc/fstab and remounts the filesystem to apply the changes.

Finally, it checks if the acl kernel module is loaded and if not, it loads it.

This script ensures that ACLs are enabled on the system.

user_quotas.sh

This script first checks if the quota package is installed and if the filesystem is mounted with quota support. If either of these checks fail, it exits with an error message.

If the quota package is installed and the filesystem is mounted with quota support, it checks if the usrquota option is set in the /etc/fstab file. If it is not set, it adds the usrquota option to the relevant filesystem in /etc/fstab and remounts the filesystem to apply the changes.

Finally, it checks if the quota service is running and if not, it starts it.

This script ensures that user quotas are enabled on the system.

aide_audit_filesystem.sh

This script first checks if the aide package is installed. If it is not, it exits with an error message.

It then initializes the AIDE database if it does not exist, using the aide --init command.

Next, it runs a filesystem check and generates a report using the aide --check command. It saves the report to a temporary file /tmp/aide_report.txt.

It then checks if the report contains any changes or errors by looking for specific strings in the report. If it finds any changes or errors, it prints the report and sends an email alert with the report attached to the administrator.

Finally, it removes the temporary report file.

This script can be used to regularly audit the filesystem and alert the administrator of any changes or potential security breaches.

Note: The above script uses the mail command to send email. This command may not be available on all systems. An alternative option is to use the sendmail command or a third-party email client, such as mutt, to send email.
