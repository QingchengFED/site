#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_5fe25b209e01_key -iv $encrypted_5fe25b209e01_iv -in .travis/id_rsa_blog_new.enc -out ~/.ssh/id_rsa -d
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "QingchengFED"
git config --global user.email wxttt@qingcheng.it
# Clone the repository
git clone git@github.com:QingchengFED/QingchengFED.github.io.git .deploy_git
# Deploy to GitHub