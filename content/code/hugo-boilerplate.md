---
author: enten
github: enten/hugo-boilerplate
ghribbon: red-upright
date: 2015-09-14T15:08:27+02:00
description: Boilerplate to start fast with hugo.
draft: false
keywords:
- hugo
- boilerplate
- static
- site
tags:
- go
- boilerplate
- site
title: Hugo Boilerplate
topics:
- project
---

Boilerplate to start fast with [Hugo](http://gohugo.io/).

## [Demo](http://enten.github.io/hugo-boilerplate/)

## Screenshot

![preview](https://raw.githubusercontent.com/enten/hugo-boilerplate/master/themes/hyde-y/images/screenshot.png)

## Requirements

* [git](http://git-scm.com)
* [hugo](https://gohugo.io)
* [node](https://nodejs.org)
* [npm](https://www.npmjs.com/about)

## Installation

```bash
# clone hugo-boilerplate into new project folder
git clone https://github.com/enten/hugo-boilerplate awesome-site

# remove origin repository (enten/hugo-boilerplate)
cd awesome-site
git remote remove origin

# start hugo development server
npm run server

Watching for changes in /home/steven/code/hugo-boilerplate/{data,content,layouts,static,themes/hyde-y}
Serving pages from /home/steven/code/hugo-boilerplate/public
Web Server is available at http://127.0.0.1:1313/hugo-boilerplate/
Press Ctrl+C to stop

```

## Deployment

### [GitHub Pages](https://pages.github.com/)

```bash
cd awesome-site

# check hugo configuration
vi config.toml

# configure origin repository
git remote add origin http://github.com/<USERNAME>/<REPONAME>

# run deployment task
npm run deploy:gh
```

__Warnings__ :

* `baseurl` in `config.toml` will be replace by the correct URL (http://username.github.io/reponame)
* static site is rebuilt in `public/` folder when `deploy:gh` is fired

### FTP

```bash
cd awesome-site

# check hugo configuration
vi config.toml

# create ftp configuration
echo '{
  "host": "ftp.example.com",
  "port": 21,
  "remote": "/www",
  "user": "*****",
  "pass": "*****"
}' > ftp-config.json

# edit ftp configuration
vi ftp-config.json

# run deployment task
npm run deploy
```

__Warnings__ :

* `remote` folder must exists on the host
* __BUG__: several attempts are needed to deploy all files

## License

Open sourced under the [MIT license](https://github.com/enten/hugo-boilerplate/blob/master/LICENSE).

