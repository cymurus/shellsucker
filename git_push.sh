#! /bin/bash

USER=cymurus
PROJECT=shellsucker

read -p 'Message: ' msg

function log()
{
    echo $1
    $1
}

git_commit="git commit -m \"${msg}\""
log $git_commit

git_add="git remote add origin git@github.com:${USER}/${PROJECT}.git"
log $git_add

git_push="git push -u origin master"
log $git_push
