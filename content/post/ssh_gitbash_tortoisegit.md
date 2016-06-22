---
author: "Andrew Goss"
title: "SSH With Git Bash and TortoiseGit for Windows"
date: "2016-06-21"
tags:
  - "git"
  - "ssh"
  - "windows"
---
<a href="https://git-scm.com" target="_blank">![Git for Windows](/img/post/git_windows.png "Git for Windows")</a><br>

If you've ever written code of any kind for professional and personal purposes, you've likely come across the concept of Source Control Management (SCM). When I first became a developer, I used Subversion as my SCM tool but have since switched to the more popular <a href="https://git-scm.com" target="_blank">Git</a>. I use git to commit the latest versions of code in both Linux and Windows environments, but I'm going to focus on Windows in this post as this is the operating system for my personal computer.

Git itself is strictly a command-line tool and in setting up my Windows machine, I wanted the ability to make passwordless commits via bash commands or through my favorite git GUI tool, <a href="https://git-scm.com" target="_blank">TortoiseGit</a>. Why passwordless? It's gets quite annoying having to enter your Github credentials every single time you push repository changes. Through the use of SSH keys, there is a secure way of doing this that allows Git Bash (or <a href="https://www.cygwin.com" target="_blank">Cygwin</a>) and TortoiseGit to play nice together. I didn't find any good current documentation for this and had to mess around a bit to get the setup I now use, hence the reason for this post.

## Step 1

Download the latest version of <a href="https://git-scm.com/download/win" target="_blank">Git for Windows</a> and install it. I would recommend you use most of the default settings, including running Git from the Windows Command Prompt so you can use Cygwin as your command-line tool if you prefer it over Git Bash, which comes with this download.

![Installing Git](/img/post/installing_git.png "Installing Git")

## Step 2

Download the latest version of <a href="https://tortoisegit.org" target="_blank">TortoiseGit</a> and install it. There are no special steps to follow here, just keep hitting 'next'. 

## Step 3

Generate an SSH key for your Github account following these <a href="https://help.github.com/articles/generating-an-ssh-key" target="_blank">instructions</a>. At the end, be sure to test your SSH connection:

```bash
$ ssh -T git@github.com
# Attempts to ssh to GitHub
```

If you did everything correctly here, two files should now exist in a .ssh folder of your home directory (for Windows this will be C:\Users\\*username*\\.ssh). By the default they will be named id_rsa (the private SSH key) and id_rsa.pub (the public SSH key). If you have Microsoft Publisher installed on your computer, it will think the public key is a publisher file (because of the .pub extension). Use 'open with' to view this key in a text editor tool like <a href="https://notepad-plus-plus.org" target="_blank">Notepad++</a>.

## Step 4

TortoiseGit uses a PuTTY private key file format, so you will need to generate a private key in this format using the private key you generated following the steps from Github. Search your programs and files for PuTTygen, which should have been installed with TortoiseGit. Open this program and go to Conversions > Import key.

Browse to the private key file you generated via `ssh-keygen` (see step 4) and import this into PuTTygen. Click the 'Save private key' button after you have imported your private SSH key to save it in PuTTY private key file format (.ppk). You will want to save it to the same location as your other keys (the .ssh folder of your home directory, C:\Users\\*username*\\.ssh).

![PuTTY Key Generator](/img/post/putty_gen.png "PuTTY Key Generator")

![SSH Keys](/img/post/ssh_keys.png "SSH Keys")

## Step 5

In your Github repository, select 'Clone with SSH' and copy the URL path to the clipboard (make sure it starts with `git@github.com`). Use TortoiseGit to to clone a copy of your Github repository to your local machine (right click in the directory, then select Git Clone...). Paste the copied URL path into TortoiseGit. Check 'Load Putty Key' and browse to the .ppk file you created in Step 5.

![TortoiseGit Clone](/img/post/tortoisegit_clone.png "TortoiseGit Clone")

Hit 'OK' and that's it! You now have a SSH repository on your Windows machine that you can push passwordless changes with using either the TortoiseGit GUI or the command line with Git Bash (or Cygwin). I tend to use TortoiseGit for one-off commits and automated deployment scripts through the command line for repositories I am frequently making changes to. Regardless of approach, it is nice to have TortoiseGit installed on your Windows machine to easily visually identify any uncommitted changes for a repository.

![TortoiseGit Repo](/img/post/tortoisegit_repo.png "TortoiseGit Repo")

```bash
andgoss@MYCOMPUTER MINGW64 /C/Github_AG/mssql-library (master)
# Push source and build repos.
git push origin master
```