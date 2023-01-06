#!/bin/bash

# Install necessary packages
apt update
apt install -y ufw fail2ban

# Enable the firewall
ufw enable

# Allow SSH connections
ufw allow ssh

# Block all incoming connections by default
ufw default deny incoming

# Allow outgoing connections
ufw default allow outgoing

# Enable IP spoofing protection
echo "nospoof on" >> /etc/host.conf

# Enable SYN cookies
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# Enable source address verification
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf

# Enable TCP SYN cookies
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# Enable TCP SYN-ACK cookies
echo "net.ipv4.tcp_synack_retries = 5" >> /etc/sysctl.conf

# Enable IP spoofing protection
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf

# Enable SYN cookies
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# Enable source address verification
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf

# Enable TCP SYN cookies
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# Enable TCP SYN-ACK cookies
echo "net.ipv4.tcp_synack_retries = 5" >> /etc/sysctl.conf

# Enable TCP SYN cookies
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# Enable TCP SYN-ACK cookies
echo "net.ipv4.tcp_synack_retries = 5" >> /etc/sysctl.conf

# Enable fail2ban
systemctl enable fail2ban
systemctl start fail2ban
