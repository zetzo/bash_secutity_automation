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
