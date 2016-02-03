#!/bin/bash

echo -e "\033[0;36mDeploying updates to GitHub...\033[0m"

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Build the project.
# hugo

# Set * to also get hidden files
# shopt -s dotglob

# Move public directory to sites
# mv C://Users/andgoss/GoLangCode/hugo/sites/andrewrgoss.com/public/* C://Users/andgoss/GoLangCode/hugo/sites/


# Add changes to git.
# git add -A

# Commit changes.
# msg="rebuilding site `date`"
# if [ $# -eq 1 ]
#  then msg="$1"
# fi
# git commit -m "$msg"

# Push source and build repos.
# git push origin master
# git subtree push --prefix=public git@github.com:spencerlyon2/hugo_gh_blog.git gh-pages