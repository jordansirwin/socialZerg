#!/usr/bin/env bash
# sets up stable node.js

# install nvm
curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

# add to profile so it loads on login
echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc

# force load profile
source ~/.bashrc 

# install stable
nvm install stable
nvm alias default stable
nvm use stable