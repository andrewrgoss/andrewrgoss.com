---
author: "Andrew Goss"
date: "2020-10-29"
title: Simplified Web Scraping Using Python Requests & Scraper API
tags:
  - programming
  - python
  - web-scraping
---
<a href="https://www.scraperapi.com?fpr=andrewrgoss" target="_blank" style="outline:none;border:none;"><img src="https://d2gdx5nv84sdx2.cloudfront.net/uploads/ssvxh57a/marketing_asset/banner/2667/069-ScraperAPI-B-GIF-320x50-v1.gif" alt="scraperapi" border="0"/></a><br>
<hr>

In the past I've <a href="https://andrewrgoss.com/projects/web_scraping_py" target=_>tried out some different web scraping techniques</a>, experimenting with different Python libraries such as <a href="https://www.crummy.com/software/BeautifulSoup" target=_>BeautifulSoup</a>, <a href="https://scrapy.org" target=_>Scrapy</a>, and <a href="https://pypi.python.org/pypi/selenium" target=_>Selenium</a>.

While I was able to extract the data I was looking for from the specific webpages my code was crawling, the internet is a vast place and not all websites are created equal. When doing web scraping at scale, sometimes it's difficult to scrape sites that are protected by anti-bots like <a href="https://www.imperva.com/products/advanced-bot-protection-management" target=_>Distil</a>, <a href="https://www.akamai.com/us/en/products/security/bot-manager.jsp" target=_>Akamai</a>, or <a href="https://www.cloudflare.com/products/bot-management" target=_>Cloudflare</a>.

I recently came across a service called <a href="https://www.scraperapi.com?fpr=andrewrgoss" target=_>Scraper API</a> that simplifies the web scraping process and these types of challenges that come with it. Scraper API acts as a proxy solution when performing web scraping - its REST API can be consumed in any programming language. For this post I'm going to demonstrate using the Python <a href="http://docs.python-requests.org/en/master" target=_>Requests</a> library. 

In order to start using this service, you need to create an account with <a href="https://www.scraperapi.com?fpr=andrewrgoss" target=_>Scraper API</a>. You'll receive an API key to use in your code. Scraper API provides 1000 free API calls per month (up to 5 concurrent requests) to get started with testing the platform.

My simple code example here demonstrates the primary benefit of doing web scraping with the Scraper API service - different rotating proxy IP addresses each time you establish a client connection. This API will take your requests and pass them through to the API which will take care of proxy rotation, captchas and retries.

When executing heavy volumes of web scraping, you may eventually hit a wall if the target site blocks your IP address. This can be expensive to overcome but fortunately, Scraper API maintains standard proxy pools containing millions of IPs. Its proxy pools are optimized to use the cleanest IPs for each specific target website. For a few particularly difficult to scrape sites, a private internal pool of residential and mobile IPs is also maintained.

<br class="custom">
{{< gist andrewrgoss 430bd96201b13f7e034524acd48e9797 >}}

Beyond this proxy solution allowing you to bypass the most complex anti-bots, if you are crawling a page that requires you to render the JavaScript on the page, these types of pages can be fetched using a headless browser. If you’d like to test other features, you can do so by simply adding a flag to your request:

* `JS Rendering → “&render=true”`
* `Geotargetting → “&country_code=us”`
* `Custom Headers → “&keep_headers=true"`
* `Premium Proxies → “&premium=true"`

<a href="https://www.scraperapi.com?fpr=andrewrgoss" target=_>Scraper API</a> is a powerful, extremely easy-to-use service for your scraping toolbox. If the free tier does not meet your needs, this promo code - `ANDREW10` - will get you a 10% discount towards any of the paid subscription plans when scaling up for more API calls, additional concurrency, and more features.