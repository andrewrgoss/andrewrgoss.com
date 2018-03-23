---
author: "Andrew Goss"
date: 2018-03-22
title: Twitter Streaming with Spark and Scala
tags:
  - spark
  - scala
  - data-streaming
---
![Spark_Scala](/img/post/spark_scala.png "Spark_Scala")<br>
<a href="/2018/udemy--apache-spark-2.0-with-scala/">Udemy- Apache Spark 2.0 With Scala</a> &gt;&gt; <b>Twitter Streaming</b><br>
<hr>

Go to:
[DataChatter](#data_chatter)

## PopularHashtags.scala

This is a Spark streaming script that monitors live tweets from Twitter and keeps track of the 10 most popular hashtags as tweets are received. 

Each hashtag is mapped to a key/value pair of (hashtag, 1) so they can be counted up over a 5-minute sliding window with this line of code:

```scala
val hashtagCounts = hashtagKeyValues.reduceByKeyAndWindow((x,y) => x + y, (x,y) => x - y, Seconds(300), Seconds(1))
```

#### Sample Output
```
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
18/03/21 11:05:05 INFO SparkContext: Running Spark version 2.2.0
18/03/21 11:05:06 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
18/03/21 11:05:06 WARN Utils: Your hostname, usbosrad3116.global.publicisgroupe.net resolves to a loopback address: 127.0.0.1; using 192.168.1.105 instead (on interface en0)
18/03/21 11:05:06 WARN Utils: Set SPARK_LOCAL_IP if you need to bind to another address
18/03/21 11:05:06 INFO SparkContext: Submitted application: PopularHashtags
18/03/21 11:05:06 INFO SecurityManager: Changing view acls to: andgoss
18/03/21 11:05:06 INFO SecurityManager: Changing modify acls to: andgoss
18/03/21 11:05:06 INFO SecurityManager: Changing view acls groups to: 
18/03/21 11:05:06 INFO SecurityManager: Changing modify acls groups to: 
18/03/21 11:05:06 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users  with view permissions: Set(andgoss); groups with view permissions: Set(); users  with modify permissions: Set(andgoss); groups with modify permissions: Set()
18/03/21 11:05:07 INFO Utils: Successfully started service 'sparkDriver' on port 55527.
18/03/21 11:05:07 INFO SparkEnv: Registering MapOutputTracker
18/03/21 11:05:07 INFO SparkEnv: Registering BlockManagerMaster
18/03/21 11:05:07 INFO BlockManagerMasterEndpoint: Using org.apache.spark.storage.DefaultTopologyMapper for getting topology information
18/03/21 11:05:07 INFO BlockManagerMasterEndpoint: BlockManagerMasterEndpoint up
18/03/21 11:05:07 INFO DiskBlockManager: Created local directory at /private/var/folders/gp/bcfcnndd1r560tcdwqpqr4t5ysdjsk/T/blockmgr-7bc076c8-378f-4be4-83b7-9ee59feac8a7
18/03/21 11:05:07 INFO MemoryStore: MemoryStore started with capacity 2004.6 MB
18/03/21 11:05:07 INFO SparkEnv: Registering OutputCommitCoordinator
18/03/21 11:05:07 INFO Utils: Successfully started service 'SparkUI' on port 4040.
18/03/21 11:05:07 INFO SparkUI: Bound SparkUI to 0.0.0.0, and started at http://192.168.1.105:4040
18/03/21 11:05:08 INFO Executor: Starting executor ID driver on host localhost
18/03/21 11:05:08 INFO Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 55528.
18/03/21 11:05:08 INFO NettyBlockTransferService: Server created on 192.168.1.105:55528
18/03/21 11:05:08 INFO BlockManager: Using org.apache.spark.storage.RandomBlockReplicationPolicy for block replication policy
18/03/21 11:05:08 INFO BlockManagerMaster: Registering BlockManager BlockManagerId(driver, 192.168.1.105, 55528, None)
18/03/21 11:05:08 INFO BlockManagerMasterEndpoint: Registering block manager 192.168.1.105:55528 with 2004.6 MB RAM, BlockManagerId(driver, 192.168.1.105, 55528, None)
18/03/21 11:05:08 INFO BlockManagerMaster: Registered BlockManager BlockManagerId(driver, 192.168.1.105, 55528, None)
18/03/21 11:05:08 INFO BlockManager: Initialized BlockManager: BlockManagerId(driver, 192.168.1.105, 55528, None)

-------------------------------------------
Time: 1521644740000 ms
-------------------------------------------
(#บุพเพสันนิวาส,21)
(#GOT7,6)
(#워너원,5)
(#동방신기,5)
(#FavMusicalGroupTwentyOnePilots,3)
(#からだすこやか茶W,3)
(#JTMA2018,3)
(#KCA,3)
(#GalaxyGift,3)
(#라이관린,3)
...

-------------------------------------------
Time: 1521644741000 ms
-------------------------------------------
(#บุพเพสันนิวาส,22)
(#GOT7,6)
(#워너원,5)
(#GalaxyGift,5)
(#동방신기,5)
(#FavMusicalGroupTwentyOnePilots,3)
(#からだすこやか茶W,3)
(#JTMA2018,3)
(#KCA,3)
(#라이관린,3)
...

-------------------------------------------
Time: 1521644742000 ms
-------------------------------------------
(#บุพเพสันนิวาส,25)
(#GOT7,6)
(#워너원,5)
(#GalaxyGift,5)
(#동방신기,5)
(#KCA,4)
(#FavMusicalGroupTwentyOnePilots,3)
(#からだすこやか茶W,3)
(#JTMA2018,3)
(#라이관린,3)
...

-------------------------------------------
Time: 1521644743000 ms
-------------------------------------------
(#บุพเพสันนิวาส,25)
(#GOT7,6)
(#워너원,5)
(#GalaxyGift,5)
(#동방신기,5)
(#KCA,4)
(#FavMusicalGroupTwentyOnePilots,3)
(#からだすこやか茶W,3)
(#JTMA2018,3)
(#라이관린,3)
...

18/03/21 11:05:44 ERROR ReceiverTracker: Deregistered receiver for stream 0: Restarting receiver with delay 2000ms: Error receiving tweets - java.util.concurrent.RejectedExecutionException: Task twitter4j.StatusStreamBase$1@7fa9614c rejected from java.util.concurrent.ThreadPoolExecutor@7a4e06c[Terminated, pool size = 0, active threads = 0, queued tasks = 0, completed tasks = 2005]
	at java.util.concurrent.ThreadPoolExecutor$AbortPolicy.rejectedExecution(ThreadPoolExecutor.java:2063)
	at java.util.concurrent.ThreadPoolExecutor.reject(ThreadPoolExecutor.java:830)
	at java.util.concurrent.ThreadPoolExecutor.execute(ThreadPoolExecutor.java:1379)
	at twitter4j.DispatcherImpl.invokeLater(DispatcherImpl.java:58)
	at twitter4j.StatusStreamBase.handleNextElement(StatusStreamBase.java:80)
	at twitter4j.StatusStreamImpl.next(StatusStreamImpl.java:56)
	at twitter4j.TwitterStreamImpl$TwitterStreamConsumer.run(TwitterStreamImpl.java:568)

Exception in thread "receiver-supervisor-future-0" java.lang.Error: java.lang.InterruptedException: sleep interrupted
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1155)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.lang.InterruptedException: sleep interrupted
	at java.lang.Thread.sleep(Native Method)
	at org.apache.spark.streaming.receiver.ReceiverSupervisor$$anonfun$restartReceiver$1.apply$mcV$sp(ReceiverSupervisor.scala:196)
	at org.apache.spark.streaming.receiver.ReceiverSupervisor$$anonfun$restartReceiver$1.apply(ReceiverSupervisor.scala:189)
	at org.apache.spark.streaming.receiver.ReceiverSupervisor$$anonfun$restartReceiver$1.apply(ReceiverSupervisor.scala:189)
	at scala.concurrent.impl.Future$PromiseCompletingRunnable.liftedTree1$1(Future.scala:24)
	at scala.concurrent.impl.Future$PromiseCompletingRunnable.run(Future.scala:24)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	... 2 more

Process finished with exit code 130 (interrupted by signal 2: SIGINT)
```

#### Takeaways

* This exercise serves as a reminder that English is not as dominant of a language as we tend to think here in America.
* GOT7 is not actually referring to Game of Thrones season 7 as I initially thought - it's actually a <a href="https://en.wikipedia.org/wiki/Got7" target=_>South Korean boy band</a>.
* The top trending topic \#บุพเพสันนิวาส translates to <a href="https://goo.gl/vEK1fx" target=_>'Bubbly'</a>, which is a (clearly popular) television drama series aired in Thailand. Given the time difference, this was likely airing live in Thailand during primetime TV hours at the same time I ran this streaming program back here in the US.
* It's unsurprising to me that pop culture references are heavily ingrained among the top trending hashtags on Twitter.
* This streaming service will run indefinitely, so I intentionally created an error when killing the program. 

## <a name="data_chatter"></a> DataChatter.scala 

I experimented a bit further by creating a new script that pulls live tweets from Twitter related to the word 'data'. I initially wanted to pull tweets related to data engineering, but the volume of tweets with both of these words was much more sparse and pretty much entirely from recruiters.

This time instead of measuring the popularity of hashtags, I wanted to see the most popular words in tweets on the topic of data. I wanted to only include meaningful words in the results so I introduced a file of stop words and symbols to filter out of the tweet words. I also excluded the word 'data' itself since these tweets all have that word in common. These were the most common words pertaining to data:

```
-------------------------------------------
Time: 1521748832000 ms
-------------------------------------------
(facebook,62)
(cambridge,22)
(zuckerberg,20)
(analytica,18)
(weather,17)
(mark,15)
(people,15)
(pm,14)
(obama,13)
(over,12)
...

-------------------------------------------
Time: 1521748834000 ms
-------------------------------------------
(facebook,65)
(cambridge,24)
(zuckerberg,21)
(analytica,19)
(weather,18)
(mark,16)
(people,16)
(pm,14)
(over,13)
(obama,13)
...
```

#### Takeaways

* At the time I streamed these tweets, there was a hot story in the news about a political data mining company called <a href="https://en.wikipedia.org/wiki/Cambridge_Analytica" target=_>Cambridge Analytica</a> and how they used personal information acquired from Facebook without users' permission. In response, Facebook banned Cambridge Analytica from advertising on its platform but the company was slow to respond and its stock valuation took a huge hit. 
* The top four words in tweets relating to data all pertained to this scandal and an additional two words 'mark' and 'obama' also can be tied to it. 
* The 'weather' word also makes sense since there was an expected nor'easter storm to hit on the day I streamed these tweets, with forecasts calling for 8-10 inches of snow in the Boston area where I live. The forecast models ended up being completely wrong and there was basically a dusting with about an inch of snow which likely caused people to question the data behind these weather models.

<a href="https://github.com/andrewrgoss/udemy-spark-scala/tree/master/twitter_streaming" class="btn" target="_blank">View my code on GitHub</a><br><br>