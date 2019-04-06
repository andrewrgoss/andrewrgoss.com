---
author: "Andrew Goss"
date: 2018-03-22
title: Twitter Streaming with Spark and Scala
tags:
  - spark
  - scala
  - data streaming
---
![Spark_Scala](/img/post/spark_scala.png "Spark_Scala")<br>
<a href="/2018/udemy--apache-spark-2.0-with-scala/">Udemy- Apache Spark 2.0 With Scala</a> &gt;&gt; <b>Twitter Streaming</b><br>
<hr>

Go to:
[DataChatter](#data_chatter) | [TweetLength](#tweet_length)

## PopularHashtags.scala

This is a Spark streaming script that monitors live tweets from Twitter and keeps track of the 10 most popular hashtags as tweets are received. 

Each hashtag is mapped to a key/value pair of (hashtag, 1) so they can be counted up over a 5-minute sliding window with this line of code:

```scala
val hashtagCounts = hashtagKeyValues.reduceByKeyAndWindow((x,y) => x + y, (x,y) => x - y, Seconds(300), Seconds(1))
```

#### Sample Output
{{< gist andrewrgoss 4a931b4504895ff4c5eabe195efc055c >}}

#### Takeaways

* This exercise serves as a reminder that English is not as dominant of a language as we tend to think here in America.
* GOT7 is not actually referring to Game of Thrones season 7 as I initially thought - it's actually a <a href="https://en.wikipedia.org/wiki/Got7" target=_>South Korean boy band</a>.
* The top trending topic \#บุพเพสันนิวาส translates to <a href="https://goo.gl/vEK1fx" target=_>'Bubbly'</a>, which is a (clearly popular) television drama series aired in Thailand. Given the time difference, this was likely airing live in Thailand during primetime TV hours at the same time I ran this streaming program back here in the US.
* It's unsurprising to me that pop culture references are heavily ingrained among the top trending hashtags on Twitter.
* This streaming service will run indefinitely, so I intentionally created an error when killing the program. 

## <a name="data_chatter"></a> DataChatter.scala 

I experimented a bit further by creating a new script that pulls live tweets from Twitter related to the word 'data'. I initially wanted to pull tweets related to data engineering, but the volume of tweets with both of these words was much more sparse and pretty much entirely from recruiters.

This time instead of measuring the popularity of hashtags, I wanted to see the most popular words in tweets on the topic of data. I wanted to only include meaningful words in the results so I introduced a file of stop words and symbols to filter out of the tweet words. I also excluded the word 'data' itself since these tweets all have that word in common. These were the most common words pertaining to data:<br><br>

{{< gist andrewrgoss 97dd40e14d9c249afc54a26fb66c776f >}}

#### Takeaways

* At the time I streamed these tweets, there was a hot story in the news about a political data mining company called <a href="https://en.wikipedia.org/wiki/Cambridge_Analytica" target=_>Cambridge Analytica</a> and how they used personal information acquired from Facebook without users' permission. In response, Facebook banned Cambridge Analytica from advertising on its platform but the company was slow to respond and its stock valuation took a huge hit. 
* The top four words in tweets relating to data all pertained to this scandal and an additional two words 'mark' and 'obama' also can be tied to it. 
* The 'weather' word also makes sense since there was an expected nor'easter storm to hit on the day I streamed these tweets, with forecasts calling for 8-10 inches of snow in the Boston area where I live. The forecast models ended up being completely wrong and there was basically a dusting with about an inch of snow which likely caused people to question the data behind these weather models.

## <a name="tweet_length"></a> TweetLength.scala

Another self-challenge I completed was creating a new script to see what the most common length of live tweets is. I again used a 5-minute window that slides every one second. These were the most common number of characters per tweet at runtime:

{{< gist andrewrgoss 3853ac19211ec5d02f14054f6436cbcd >}}

#### Takeaways

* People on Twitter have a lot to say. Most people hit exactly the maximum 140-character limit, or push right up against it.

<a href="https://github.com/andrewrgoss/udemy-spark-scala/tree/master/twitter_streaming" class="btn" target="_blank">View my code on GitHub</a><br class="custom">