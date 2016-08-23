---
author: "Andrew Goss"
title: "SSH Keys With PuTTY and Cygwin for Windows"
date: "2016-08-22"
tags:
  - "cygwin"
  - "putty"
  - "ssh"
  - "windows"
---
<a href="http://www.chiark.greenend.org.uk/~sgtatham/putty" target="_blank">![PuTTY: a free SSH and Telnet client](/img/post/putty.jpg "PuTTY: a free SSH and Telnet client")</a><br>

In my work at <a href="http://www.digitaslbi.com/us" target="_blank">DigitasLBi</a>, I need to login to a number of client-specific Linux machines via a terminal emulator (there is no UI for these remote environments) from my local Windows laptop. For this my team uses <a href="https://www.cygwin.com" target="_blank">Cygwin</a>, a Linux-like environment for Windows making it possible to port software running on POSIX systems (such as Linux, BSD, and Unix systems) to Windows. It's possible to login of course just using a standard username/password combination with <a href="https://mosh.org" target="_blank">Mosh</a> or <a href="https://en.wikipedia.org/wiki/Secure_Shell" target="_blank">SSH</a> at the command line. However, the more secure (and easier to manage) approach is to utilize SSH keys to login into a virtual private server. 

In this post, I'll delve into how I've set up my computer to use public/private SSH key pairings for accessing different environments. I previously <a href="/2016/ssh-with-git-bash-and-tortoisegit-for-windows">posted</a> about using SSH keys with Git Bash and TortoiseGit for Windows. While it's possible to use the same SSH key pairings that were used for that, I prefer the more secure approach of generating specific pairings for <a href="https://github.com" target="_blank">Github&nbsp;<img src="/img/github.png"></a>&nbsp;,&nbsp;<a href="https://about.gitlab.com" target="_blank">Gitlab&nbsp;<img src="/img/gitlab.png"></a>, and any client-specific instances.

## Step 1

Download the following PuTTY files from this site: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html. 

* PuTTY (the SSH and Telnet client itself)
* Pageant (an SSH authentication agent for PuTTY, PSCP, PSFTP, and Plink)
* PuTTYgen (an RSA and DSA key generation utility)

## Step 2

Using the downloaded PuTTYgen executable, <a href="https://winscp.net/eng/docs/ui_puttygen#generating_a_new_key" target="_blank">generate a new key</a>. Click the 'Save public key' and 'Save private key' buttons to save these to the same location as your other keys (the .ssh folder of your home directory, C:\Users\\*username*\\.ssh). When saving the private key you will be optionally asked to enter a password for another layer of security if desired - it is also possible to hit 'OK' and not use a password in combination with the SSH private key. Keep PuTTYgen open for now as you will need to copy the public key value into the authorized_keys files on the appropriate private server.

![PuTTY Key Generator](/img/post/putty_gen.PNG "PuTTY Key Generator")

## Step 3

Open up Cygwin and log into the machine that you wish to configure with SSH keys. You'll need the standard username/password credentials for the instance for now.