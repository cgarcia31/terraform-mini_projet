#!/bin/bash
echo -e "y\n" | amazon-linux-extras install nginx1
systemctl enable --now nginx
