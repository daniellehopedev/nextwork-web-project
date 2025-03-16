#!/bin/bash
# isExistApp="$(pgrep httpd)"
# if [[ -n $isExistApp ]]; then
# sudo systemctl stop httpd.service
# fi
# isExistApp="$(pgrep tomcat)"
# if [[ -n $isExistApp ]]; then
# sudo systemctl stop tomcat.service
# fi

isExistApp="$(pgrep httpd)"
if [[ -n $isExistApp ]]; then
sudo systemctll stop httpd.service  # Intentional error here
fi
isExistApp="$(pgrep tomcat)"
if [[ -n $isExistApp ]]; then
sudo systemctll stop tomcat.service  # Intentional error here
fi
