#!/bin/bash

# Update the package repository
apt update

# Install available security updates
apt upgrade -y --security
