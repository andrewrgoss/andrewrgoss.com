---
author: "Andrew Goss"
title: "Why I Switched from Wordpress to Hugo"
date: "2015-10-25"
tags:
  - "hugo"
  - "web"
  - "wordpress"
---
<a href="https://gohugo.io" target="_blank">![Hugo](/img/post/hugo.png "Hugo")</a><br>
For a long time I've believed in the importance of having a blog but have struggled to keep one going. I started out using <a href="https://www.blogger.com" target="_blank">Blogger</a> back in the day and most recently was using <a href="https://wordpress.org" target="_blank">Wordpress</a>. But there were features about these blogging platforms that consistently bugged me. Fortunately for me, while I was learning the <a href="http://golang.org" target="_blank">Go</a> programming language I stumbled across <a href="https://gohugo.io" target="_blank">Hugo</a>, a static site generator written in this language. I started experimenting with Hugo and instantly loved it. I experimented with several different themes and eventually migrated my blog from Wordpress to Hugo. Here are the features I like most about Hugo and how I compare it to Wordpress.

## Live Previews

Every time I prepared a post on Wordpress with text and articles I would have to publish it to see how it looks within the context of the overall site. Yes- it's true that you can save content in draft mode and only make it live after proof-reading. But this was in a different screen - the admin section. I much prefer to see a live preview of the full site as I work. When I discovered Hugo and started experimenting with it, I fell in love with the `hugo server` command. This is an inbuilt server that can serve up your website content so you can instantly preview changes as part of the full site the second you save them. There is a way to render drafts too with the `--buildDrafts` parameter but I prefer just running the production version knowing that since my site is hosted on <a href="https://pages.github.com" target="_blank">GitHub Pages</a>, nothing will happen until I commit and push the changes. 

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

The bash script code above is nicely formatted right? The fact that Hugo supports <a href="https://daringfireball.net/projects/markdown" target="_blank">Markdown</a> as well as straight-up HTML is another feature I greatly enjoy. For anyone unfamiliar with Markdown, it is a plain text formatting syntax that gets converted to HTML. Using Markdown makes it easier and much quicker to write technical posts as it supports syntax highlighting for a ton of languages. I knew that some of my more technical posts needed to contain code snippets but Wordpress isn't too-friendly for this working in a WYSIWYG editor. Simply copying and pasting this code within a post doesn't work as it removes all of the syntax highlighting and formatting from my favorite IDE (interactive development environment) tools. Yes, there are plugins to support this - but I'm comfortable working in Markdown and it's nice to be able to write up content offline if needed. 

## Free Hosting With Github Pages

With Wordpress I used <a href="https://www.bluehost.com" target="_blank">BlueHost</a> as my web host, as many do with their Wordpress blogs. It is easy to use and cheap (I was paying $2.99 a month). Moreover, it has lots of features designed specifically for Wordpress usage. The setup was easy enough using a one-click install from the hosting dashboard and then being able to install plugins, themes, and updates, all from the Wordpress admin. But I had to login through that dashboard every time to access my Wordpress site. And while my monthly cost was small, I much prefer free. 

## Custom Themes

I knew I wanted a minimalistic, responsive site that is easy to navigate without too much scrolling. I'm not going to deny that Hugo has nowhere near the numbers of themes that Wordpress does. On Wordpress I searched through probably hundreds of different themes before settling on <a href="http://www.s5themes.com/theme/focused" target="_blank">Focused</a>. Hugo is continuing to add more themes to its library but searching through them was a lot easier since they all live on the <a href="https://gohugo.io" target="_blank">Hugo website</a>. With Wordpress both free and paid themes are scattered across the interwebs. I also found the source code much easier to obtain for the Hugo themes since each one is free and links to its respective Github repository. 

## Rendering Speed

Lastly, my site rendered very slowly with Wordpress/BlueHost. I’m already a fan and user of the Go language, and so in following a number of the Go social communities, I discovered Hugo. One of the most popular aspects of Go is speed as it is a langauge with subroutines baked in making it easy to execute concurrent processes. The Hugo static site generator is written in Go. A static site generator is an application that can take content in some original description (markdown in the case of Hugo) and render final content by applying rules. This final content can then be hosted anywhere, without the need for server-side runtime support such as Python/PHP/Go/Node/etc. This is because it does not require server-side processing to handle rendering pages on the fly. This makes the site very portable and simple to deploy and can be served out of aggressive caching.

## Disadvantages

One of the major disadvantages of Hugo, or any static site generator for that matter, is integrating search. You either need some <a href="http://discuss.gohugo.io/t/how-are-you-implementing-site-search/986/14" target="_blank">JavaScript magic</a> or a 3rd party search provider like <a href="Google Custom Search Engine" target="_blank">Google Custom Search Engine</a>, which is what I went for.

The other dynamic part of an ordinary blog is the comment section. Again, the easiest way to fix this is relying on a 3rd party comments plugin like <a href="https://disqus.com" target="_blank">Disqus</a>. Hugo offers <a href="https://gohugo.io/extras/comments" target="_blank">support</a> for this and makes it fairly simple to implement.

Even though Hugo does not come with search or a comments section as built-in features, I didn't take issue with this as I quickly found ways to integrate them anyways. So to me, these two disadvantages are easily outweighed by the advantages of a static website. Your website will survive <a href="https://en.wikipedia.org/wiki/Slashdot_effect" target="_blank">slashdotting</a> and the only required maintenance is literally making sure your web server stays online (and I think I'm in pretty good shape with Github).

## Conclusion

Wordpress is the most popular content management system (CMS) for a reason. There are countless commercial websites and personal blogs powered by Wordpress along with thousands of customizable plugins. You don't necessarily have to know how to program to build a beautiful-looking Wordpress site. But if you are someone who is comfortable coding and looking to publish a personal website/blog that is lightning-quick, highly customizable and free (open-source), Hugo may be a good choice for you. For me it has also been a great way to practice front-end development as most of my time is spent on the back-end. And if you ever get stuck, there is a great <a href="https://discuss.gohugo.io" target="_blank">Hugo community</a> for Q&A support.