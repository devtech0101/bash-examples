#!/bin/bash
##################################################################################
# CMIT-291 bash script example with git - author devarshi.pathak@faculty.umgc.edu
##################################################################################
# directory as the folder to look through
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
##################################################################################


REPOSITORIES=`pwd`
TAGSTAMP=`date +%Y-%m-%d.%H%M%S`

while getopts u:e: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        e) email=${OPTARG};;
    esac
done

if [ $# -eq 0 ]; then
    echo "No arguments provided, please provide username and email address of your Git account"
    echo -e "Username: $username";
    echo -e "Email: $email";
    exit 1
fi

git config --global user.name $username
git config --global user.email $email
git config --global credential.helper store

echo ""
echo "#########################################"
echo "Today's date: as ${TAGSTAMP}"
echo "Welcome, user: $USER, your the Git setup is completed..."
echo "#########################################"
git_log=$(git log)
git_status=$(git status)
sleep 5

git clone https://github.com/devtech0101/bash-examples.git

cd bash-examples

git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
git fetch

for branch in $(git branch -r); do
    [[ $branch =~ origin/pr/ ]] && git merge $branch
done

echo "Current Git status: $git_status $git_log"
sleep 5
