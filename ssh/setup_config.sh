#!/usr/bin/env sh

mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

SSH_CONFIG_FILE=$HOME/.ssh/config
GITHUB_KEY=ghub_accountname_key
GITLAB_KEY=glab_accountname_key

touch $SSH_CONFIG_FILE
echo "Host github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/$GITHUB_KEY
Host gitlab.com
  Preferredauthentications publickey
  IdentityFile ~/.ssh/$GITLAB_KEY
" >> $SSH_CONFIG_FILE
