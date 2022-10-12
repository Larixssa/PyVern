#!/bin/bash

CONFIG_NAME="config"

echo "Generating \"config\" directory."
mkdir $CONFIG_NAME
touch "${CONFIG_NAME}/cursor.txt"
touch "${CONFIG_NAME}/id.txt"
touch "${CONFIG_NAME}/profile.txt"
touch "${CONFIG_NAME}/repo-desc.txt"
touch "${CONFIG_NAME}/selection-cursor.txt"

echo "Generating \"logs\" directory."
mkdir "logs"
touch "logs/logfile.txt"
