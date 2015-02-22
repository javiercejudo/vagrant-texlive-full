#!/bin/bash

# enable multiverse repo and update
sudo sed -i "/^# deb .* multiverse$/ s/^# //" /etc/apt/sources.list
apt-get update

# install texlive
apt-get install -y texlive-full
