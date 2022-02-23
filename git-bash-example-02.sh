#!/bin/bash
#########################################
# CMIT-291 bash script example with git
#########################################
# directory as the folder to look through
#REPOSITORIES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

REPOSITORIES=`pwd`
TAGSTAMP=`date +%Y-%m-%d.%H%M%S`
echo "Tagging as ${TAGSTAMP}"

for REPO in `ls "$REPOSITORIES/"`
do
  if [ -d "$REPOSITORIES/$REPO" ]
  then
    echo "Updating $REPOSITORIES/$REPO at `date`"
    if [ -d "$REPOSITORIES/$REPO/.git" ]
    then
      cd "$REPOSITORIES/$REPO"
      git status
      echo "Fetching"
      git fetch
      echo "Pulling"
      git pull
    else
      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
    echo
  fi
done

https://github.com/devtech0101/linux-baseline.git

git clone https://github.com/devtech0101/bash-examples.git

cd bash-examples

git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
git fetch

for branch in $(git branch -r); do
    [[ $branch =~ origin/pr/ ]] && git merge $branch
done

echo "Checking out master branch"
git checkout master
git pull origin master

echo "Pushing commits and tags"
git push
git push --tags

echo "Checking out develop branch"
git checkou
