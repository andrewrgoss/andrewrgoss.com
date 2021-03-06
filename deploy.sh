#!/bin/sh

echo -e "\033[0;36mDeploying andrewrgoss.com updates to GitHub...\033[0m"

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
hugo

# Recursively copy public directory contents to the github.io repo.
if [ "$GOPATH" = "C:\Users\Andrew\GoLangCode" ]; then
    cp -R C://Users/Andrew/GoLangCode/hugo/sites/andrewrgoss.com/public/* C://Users/Andrew/GoLangCode/hugo/sites/andrewrgoss.github.io/
else
	cp -R $GITHUB_AG/hugo/sites/andrewrgoss.com/public/* $GITHUB_AG/hugo/sites/andrewrgoss.github.io/
fi

# Get rid of public directory.
rm -R public/

# Change directory to github.io repo for final git commit here.
if [ "$GOPATH" = "C:\Users\Andrew\GoLangCode" ]; then
    cd $GOPATH/hugo/sites/andrewrgoss.github.io/
else
	cd $GITHUB_AG/hugo/sites/andrewrgoss.github.io/
fi

echo -e "\033[0;36mDeploying andrewrgoss.github.io updates to GitHub...\033[0m"

# Add changes for this repo to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
 then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
