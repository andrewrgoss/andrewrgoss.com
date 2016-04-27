---
author: "Andrew Goss"
title: "Why I Switched to Hugo... And Love It"
description: "Why I made the switch from using Wordpress to Hugo."
date: "2015-10-25"
tags:
  - "hugo"
  - "web"
  - "wordpress"
---
<a href="https://gohugo.io" target="_blank">![Hugo](/img/post/hugo.png "Hugo")</a><br>
For a long time I've believed in the importance of having a blog but have struggled to keep one going. I started out using Blogger back in the day and most recently was using Wordpress. But there were features about these blogging platforms that consistently bugged me. 

## Live Previews

Every time I prepared a post with the text and articles I would have to publish it to see how it looks within the context of the overall site. Yes- it's true that you can save content in draft mode and only make it live after proof-reading. But this was in a different screen - the admin section. I much prefer to see a live preview of the full site as I work. When I discovered Hugo and started experimenting with it, I fell in love with the `hugo server` command. This is an inbuilt server that can serve up your website content so that you can instantly preview changes as part of the full site the second you save them. There is a way to render drafts too with the `--buildDrafts` parameter but I prefer just running the production version knowing that since my site is hosted on <a href="https://pages.github.com" target="_blank">GitHub Pages</a>, nothing will happen until I commit and push the changes. 

```bash
Change detected, rebuilding site
2016-04-25 17:17 -0400
0 draft content
0 future content
10 pages created
13 paginator pages created
9 tags created
in 96 ms
```

## Markdown Support

^ That's some nicely-formatted bash script code in this post eh? The fact that <a href="https://gohugo.io" target="_blank">Hugo</a> supports <a href="https://daringfireball.net/projects/markdown" target="_blank">Markdown</a> as well as straight-up HTML is another feature I greatly enjoy. For anyone unfamiliar with Markdown, it is a plain text formatting syntax that gets converted to HTML. Using Markdown makes it easier and much quicker to write technical posts as it supports syntax highlighting for a ton of languages. I knew that some of my more technical posts needed to contain code snippets but Wordpress isn't too-friendly for this working in a WYSIWYG editor. Simply copying and pasting this code within a post doesn't work as it removes all of the syntax highlighting and formatting from my favorite IDE (interactive development environment) tools. Yes, there are plugins to support this - but I'm comfortable working in Markdown and it's nice to be able to write up content offline if needed. 

With Wordpress it was the setup was easy enough using a one-click install from a hosting dashboard (BlueHost in my case) and then being able to install plugins, themes, and updates, all from the Wordpress admin. But I had to login through that dashboard every time to access my Wordpress site. On top of that, I was paying a small monthly cost for this hosting. 

Lastly, my site rendered very slowly with Wordpress. I’m already a fan and user of the Go language, and so in following a number of the Go social communities, I discovered Hugo. A static site generator is an application that can take content in some original description (markdown in the case of Hugo), and renders final content by applying rules. This final content can then be hosted anywhere, without the need for server-side runtime support, such as Python/PHP/Go/Node/etc, because it does not require server-side processing to handle rendering the pages on the fly. This makes the site very portable and simple to deploy, and can be served out of aggressive caching.

I never used Jekyll personally, but I've heard of it. A few other static site generators <a href="https://www.staticgen.com" target="_blank">have sprung up</a> since Jekyll's success.

The one that caught my attention was [Hugo](http://gohugo.io). It has all the goodness from Jekyll, but it's way easier to setup. Hugo itself is written in [Go](http://golang.org), but they build [executable binaries](https://github.com/spf13/hugo/releases) for a lot of platforms and architectures. So you don't need to install anything else. Even compiling it yourself isn't that hard.

The process of creating a new website is very similar to Jekyll. The `hugo` command literally explains itself (`hugo help`) and the [documentation](http://gohugo.io/overview/introduction/) on its website should suffice for most users.

I've successfully migrated my [Jekyll blog](https://github.com/SamuelDebruyn/samueldebruyn.github.io/tree/5f5719a9d4519f8fbd4cdfffa2a10b3f066401ef) to [Hugo](https://github.com/SamuelDebruyn/sa.muel.be-hugo) and haven't regretted it ever since.

## Disadvantages

One of the major disadvantages of Hugo, or any static site generator for that matter, is integrating **search**. You need some [JavaScript magic](http://discuss.gohugo.io/t/how-are-you-implementing-site-search/986/14) or a 3rd party search provider like [Google Custom Search Engine](https://cse.google.com) (which I went for).

The other dynamic part of an ordinary blog is **the comment section**. Again, the easiest way to *fix* this is relying on a 3rd party comments plugin like [Disqus](https://disqus.com/).

Still, these two disadvantages are easily outweighed by the advantages of a static website. Your website will survive [slashdotting](https://en.wikipedia.org/wiki/Slashdot_effect) and the only required maintenance is literally making sure your web server stays online.