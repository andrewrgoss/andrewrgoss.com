---
author: "Andrew Goss"
title: "Why I Switched to Hugo"
description: "Why I made the switch from using Wordpress to Hugo."
date: "2016-01-26"
tags:
  - "hugo"
  - "web"
  - "wordpress"
---

Why I made the switch from Wordpress to Hugo…

## A good blogging platform

What makes a good blogging platform really good? Well, that depends on the blogger. Programmers would need different features than make-up bloggers. As a programmer, I need to be able to easily integrate pieces of code with syntax highlighting in my posts and I'd prefer writing them in my favorite text/code editor instead of in a WYSIWYG editor.

## Wordpress

Started out using this.

## Hugo

I never used Jekyll personally, but I've heard of it. A few other static site generators <a href="https://www.staticgen.com" target="_blank">have sprung up</a> since Jekyll's success.

The one that caught my attention was [Hugo](http://gohugo.io). It has all the goodness from Jekyll, but it's way easier to setup. Hugo itself is written in [Go](http://golang.org), but they build [executable binaries](https://github.com/spf13/hugo/releases) for a lot of platforms and architectures. So you don't need to install anything else. Even compiling it yourself isn't that hard.

The process of creating a new website is very similar to Jekyll. The `hugo` command literally explains itself (`hugo help`) and the [documentation](http://gohugo.io/overview/introduction/) on its website should suffice for most users.

I've successfully migrated my [Jekyll blog](https://github.com/SamuelDebruyn/samueldebruyn.github.io/tree/5f5719a9d4519f8fbd4cdfffa2a10b3f066401ef) to [Hugo](https://github.com/SamuelDebruyn/sa.muel.be-hugo) and haven't regretted it ever since.

## Disadvantages

One of the major disadvantages of Hugo, or any static site generator for that matter, is integrating **search**. You need some [JavaScript magic](http://discuss.gohugo.io/t/how-are-you-implementing-site-search/986/14) or a 3rd party search provider like [Google Custom Search Engine](https://cse.google.com) (which I went for).

The other dynamic part of an ordinary blog is **the comment section**. Again, the easiest way to *fix* this is relying on a 3rd party comments plugin like [Disqus](https://disqus.com/).

Still, these two disadvantages are easily outweighed by the advantages of a static website. Your website will survive [slashdotting](https://en.wikipedia.org/wiki/Slashdot_effect) and the only required maintenance is literally making sure your web server stays online.


<div id="comments" data-role="none">
  <h2>
    Comments
  </h2>
  <ol class="commentlist unstyled">
      <div id="disqus_thread"></div>
    <script type="text/javascript">
        var disqus_shortname = 'andrewrgoss';
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
  </ol>
</div><!-- #comments -->