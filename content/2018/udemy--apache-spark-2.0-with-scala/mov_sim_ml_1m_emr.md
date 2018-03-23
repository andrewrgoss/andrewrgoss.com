---
author: "Andrew Goss"
date: 2018-03-08
title: Udemy- Apache Spark 2.0 With Scala
---
![Spark_Scala](/img/post/spark_scala.png "Spark_Scala")<br>
<a href="/2018/udemy--apache-spark-2.0-with-scala/">Udemy- Apache Spark 2.0 With Scala</a> >> <b>Creating Similar Movies from One Million Ratings on EMR</b><br>
<hr>

I completed an exercise of compiling a .jar file from my Scala code through IntelliJ IDEA, uploading this to a S3 bucket I created, and then running a Spark job on a AWS EMR cluster that I spun up. Here are the steps I took with screenshots, since I terminated my EMR cluster at the end to avoid incurring unnecessary costs. 

### Create S3 Bucket

Set up a S3 bucket to store log files from my EMR cluster, the .jar executable, and the .dat files from the <a href="https://grouplens.org/datasets/movielens/1m" target=_>MovieLens 1M dataset</a>. 

![S3 Bucket](/img/2018/udemy--apache-spark-2.0-with-scala/s3_bucket.png "S3 Bucket")

### Create EMR Cluster

I created a new EMR cluster with the following configurations initially, but I ended up actually having to tweak the instance type setting from m3.xlarge to m1.medium for the particular availability zone I used. Still created 1 master and 2 slaves nodes in the cluster (3 total instances).

![Creating EMR Cluster](/img/2018/udemy--apache-spark-2.0-with-scala/create_emr_cluster.png "Creating EMR Cluster")

![EMR Cluster Summary](/img/2018/udemy--apache-spark-2.0-with-scala/emr_cluster_summary.png "EMR Cluster Summary")

### Running the Spark Job on the EMR Cluster

Once my new EMR cluster was available for use, I tried to connect to it with SSH from my MacBook. On the first attempt, the operation timed out:

```
usbosrad3116:~ andgoss$ ssh -i ~/.credentials/ag-spark.pem hadoop@ec2-34-236-254-148.compute-1.amazonaws.com
ssh: connect to host ec2-34-236-254-148.compute-1.amazonaws.com port 22: Operation timed out
```

To address this, I navigated to the security group for the master node of my EMR cluster (from the EMR summary tab). From here, I edited the inbound rules to add a new one to open up the port to SSH from my computer's IP address:

![Open SSH Port](/img/2018/udemy--apache-spark-2.0-with-scala/open_ssh_port_master_node.png "Open SSH Port")

Here is the terminal output from successfully running this Spark job across my (temporary) EMR cluster. I removed the repetitive warnings to make this more readable. Once this finished running I terminated this cluster through the AWS console. 

```
usbosrad3116:~ andgoss$ ssh -i ~/.credentials/ag-spark.pem hadoop@ec2-34-236-254-148.compute-1.amazonaws.com
The authenticity of host 'ec2-34-236-254-148.compute-1.amazonaws.com (34.236.254.148)' cannot be established.
ECDSA key fingerprint is SHA256:XP2ivgx0zDR1PEwr+fyY9YhiBnK3M0/HVZjwqBSzSgI.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ec2-34-236-254-148.compute-1.amazonaws.com,34.236.254.148' (ECDSA) to the list of known hosts.
Last login: Thu Mar  8 16:53:31 2018

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2017.09-release-notes/
3 package(s) needed for security, out of 5 available
Run "sudo yum update" to apply all updates.
                                                                    
EEEEEEEEEEEEEEEEEEEE MMMMMMMM           MMMMMMMM RRRRRRRRRRRRRRR    
E::::::::::::::::::E M:::::::M         M:::::::M R::::::::::::::R   
EE:::::EEEEEEEEE:::E M::::::::M       M::::::::M R:::::RRRRRR:::::R 
  E::::E       EEEEE M:::::::::M     M:::::::::M RR::::R      R::::R
  E::::E             M::::::M:::M   M:::M::::::M   R:::R      R::::R
  E:::::EEEEEEEEEE   M:::::M M:::M M:::M M:::::M   R:::RRRRRR:::::R 
  E::::::::::::::E   M:::::M  M:::M:::M  M:::::M   R:::::::::::RR   
  E:::::EEEEEEEEEE   M:::::M   M:::::M   M:::::M   R:::RRRRRR::::R  
  E::::E             M:::::M    M:::M    M:::::M   R:::R      R::::R
  E::::E       EEEEE M:::::M     MMM     M:::::M   R:::R      R::::R
EE:::::EEEEEEEE::::E M:::::M             M:::::M   R:::R      R::::R
E::::::::::::::::::E M:::::M             M:::::M RR::::R      R::::R
EEEEEEEEEEEEEEEEEEEE MMMMMMM             MMMMMMM RRRRRRR      RRRRRR
                                                                    
[hadoop@ip-172-31-67-129 ~]$ pwd
/home/hadoop
[hadoop@ip-172-31-67-129 ~]$ aws s3 cp s3://ag-spark/ml-1m/movies.dat ./
download: s3://ag-spark/ml-1m/movies.dat to ./movies.dat          

[hadoop@ip-172-31-67-129 ~]$ aws s3 cp s3://ag-spark/MovieSimilarities1M.jar ./
download: s3://ag-spark/MovieSimilarities1M.jar to ./MovieSimilarities1M.jar
[hadoop@ip-172-31-67-129 ~]$ ls -ltra
total 260
-rw-r--r-- 1 hadoop hadoop    331 Feb 13 19:03 .bashrc
-rw-r--r-- 1 hadoop hadoop     85 Feb 13 19:03 .bash_profile
drwxr-xr-x 2 hadoop hadoop   4096 Feb 13 19:06 .aws
-rw-rw-r-- 1 hadoop hadoop 171308 Mar  8 15:33 movies.dat
drwxr-xr-x 4 root   root     4096 Mar  8 16:35 ..
drwx------ 2 hadoop hadoop   4096 Mar  8 16:36 .ssh
-rw-rw-r-- 1 hadoop hadoop  68515 Mar  8 17:08 MovieSimilarities1M.jar
drwxr-xr-x 4 hadoop hadoop   4096 Mar  8 17:08 .

[hadoop@ip-172-31-67-129 ~]$ spark-submit --class com.andrewrgoss.spark.MovieSimilarities1M MovieSimilarities1M.jar 260

Loading movie names...
18/03/08 17:10:38 INFO GPLNativeCodeLoader: Loaded native gpl library
18/03/08 17:10:38 INFO LzoCodec: Successfully loaded & initialized native-lzo library [hadoop-lzo rev cfe28705e7dfdec92539cc7b24fc97936c259a05]
[Stage 2:>                                                         (0 + 8) / 16]18/03/08 17:12:45 WARN ServletHandler: 
javax.servlet.ServletException: java.util.NoSuchElementException: None.get
	at org.glassfish.jersey.servlet.WebComponent.serviceImpl(WebComponent.java:489)
	at org.glassfish.jersey.servlet.WebComponent.service(WebComponent.java:427)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:388)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:341)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:228)
	at org.spark_project.jetty.servlet.ServletHolder.handle(ServletHolder.java:845)
	at org.spark_project.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1689)
	at org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.doFilter(AmIpFilter.java:171)
	at org.spark_project.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1676)
	at org.spark_project.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:581)
	at org.spark_project.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1180)
	at org.spark_project.jetty.servlet.ServletHandler.doScope(ServletHandler.java:511)
	at org.spark_project.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:1112)
	at org.spark_project.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:141)
	at org.spark_project.jetty.server.handler.gzip.GzipHandler.handle(GzipHandler.java:461)
	at org.spark_project.jetty.server.handler.ContextHandlerCollection.handle(ContextHandlerCollection.java:213)
	at org.spark_project.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:134)
	at org.spark_project.jetty.server.Server.handle(Server.java:524)
	at org.spark_project.jetty.server.HttpChannel.handle(HttpChannel.java:319)
	at org.spark_project.jetty.server.HttpConnection.onFillable(HttpConnection.java:253)
	at org.spark_project.jetty.io.AbstractConnection$ReadCallback.succeeded(AbstractConnection.java:273)
	at org.spark_project.jetty.io.FillInterest.fillable(FillInterest.java:95)
	at org.spark_project.jetty.io.SelectChannelEndPoint$2.run(SelectChannelEndPoint.java:93)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.executeProduceConsume(ExecuteProduceConsume.java:303)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.produceConsume(ExecuteProduceConsume.java:148)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.run(ExecuteProduceConsume.java:136)
	at org.spark_project.jetty.util.thread.QueuedThreadPool.runJob(QueuedThreadPool.java:671)
	at org.spark_project.jetty.util.thread.QueuedThreadPool$2.run(QueuedThreadPool.java:589)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.util.NoSuchElementException: None.get
	at scala.None$.get(Option.scala:347)
	at scala.None$.get(Option.scala:345)
	at org.apache.spark.status.api.v1.MetricHelper.submetricQuantiles(AllStagesResource.scala:313)
	at org.apache.spark.status.api.v1.AllStagesResource$$anon$1.build(AllStagesResource.scala:178)
	at org.apache.spark.status.api.v1.AllStagesResource$.taskMetricDistributions(AllStagesResource.scala:181)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$taskSummary$1.apply(OneStageResource.scala:71)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$taskSummary$1.apply(OneStageResource.scala:62)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$withStageAttempt$1.apply(OneStageResource.scala:130)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$withStageAttempt$1.apply(OneStageResource.scala:126)
	at org.apache.spark.status.api.v1.OneStageResource.withStage(OneStageResource.scala:97)
	at org.apache.spark.status.api.v1.OneStageResource.withStageAttempt(OneStageResource.scala:126)
	at org.apache.spark.status.api.v1.OneStageResource.taskSummary(OneStageResource.scala:62)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.glassfish.jersey.server.model.internal.ResourceMethodInvocationHandlerFactory$1.invoke(ResourceMethodInvocationHandlerFactory.java:81)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher$1.run(AbstractJavaResourceMethodDispatcher.java:144)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.invoke(AbstractJavaResourceMethodDispatcher.java:161)
	at org.glassfish.jersey.server.model.internal.JavaResourceMethodDispatcherProvider$TypeOutInvoker.doDispatch(JavaResourceMethodDispatcherProvider.java:205)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.dispatch(AbstractJavaResourceMethodDispatcher.java:99)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.invoke(ResourceMethodInvoker.java:389)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:347)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:102)
	at org.glassfish.jersey.server.ServerRuntime$2.run(ServerRuntime.java:326)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:271)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:267)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:315)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:297)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:267)
	at org.glassfish.jersey.process.internal.RequestScope.runInScope(RequestScope.java:317)
	at org.glassfish.jersey.server.ServerRuntime.process(ServerRuntime.java:305)
	at org.glassfish.jersey.server.ApplicationHandler.handle(ApplicationHandler.java:1154)
	at org.glassfish.jersey.servlet.WebComponent.serviceImpl(WebComponent.java:473)
	... 28 more
18/03/08 17:12:45 WARN HttpChannel: //ip-172-31-67-129.ec2.internal:4040/api/v1/applications/application_1520527212392_0001/stages/3/0/taskSummary?proxyapproved=true
javax.servlet.ServletException: java.util.NoSuchElementException: None.get
	at org.glassfish.jersey.servlet.WebComponent.serviceImpl(WebComponent.java:489)
	at org.glassfish.jersey.servlet.WebComponent.service(WebComponent.java:427)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:388)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:341)
	at org.glassfish.jersey.servlet.ServletContainer.service(ServletContainer.java:228)
	at org.spark_project.jetty.servlet.ServletHolder.handle(ServletHolder.java:845)
	at org.spark_project.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1689)
	at org.apache.hadoop.yarn.server.webproxy.amfilter.AmIpFilter.doFilter(AmIpFilter.java:171)
	at org.spark_project.jetty.servlet.ServletHandler$CachedChain.doFilter(ServletHandler.java:1676)
	at org.spark_project.jetty.servlet.ServletHandler.doHandle(ServletHandler.java:581)
	at org.spark_project.jetty.server.handler.ContextHandler.doHandle(ContextHandler.java:1180)
	at org.spark_project.jetty.servlet.ServletHandler.doScope(ServletHandler.java:511)
	at org.spark_project.jetty.server.handler.ContextHandler.doScope(ContextHandler.java:1112)
	at org.spark_project.jetty.server.handler.ScopedHandler.handle(ScopedHandler.java:141)
	at org.spark_project.jetty.server.handler.gzip.GzipHandler.handle(GzipHandler.java:461)
	at org.spark_project.jetty.server.handler.ContextHandlerCollection.handle(ContextHandlerCollection.java:213)
	at org.spark_project.jetty.server.handler.HandlerWrapper.handle(HandlerWrapper.java:134)
	at org.spark_project.jetty.server.Server.handle(Server.java:524)
	at org.spark_project.jetty.server.HttpChannel.handle(HttpChannel.java:319)
	at org.spark_project.jetty.server.HttpConnection.onFillable(HttpConnection.java:253)
	at org.spark_project.jetty.io.AbstractConnection$ReadCallback.succeeded(AbstractConnection.java:273)
	at org.spark_project.jetty.io.FillInterest.fillable(FillInterest.java:95)
	at org.spark_project.jetty.io.SelectChannelEndPoint$2.run(SelectChannelEndPoint.java:93)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.executeProduceConsume(ExecuteProduceConsume.java:303)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.produceConsume(ExecuteProduceConsume.java:148)
	at org.spark_project.jetty.util.thread.strategy.ExecuteProduceConsume.run(ExecuteProduceConsume.java:136)
	at org.spark_project.jetty.util.thread.QueuedThreadPool.runJob(QueuedThreadPool.java:671)
	at org.spark_project.jetty.util.thread.QueuedThreadPool$2.run(QueuedThreadPool.java:589)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.util.NoSuchElementException: None.get
	at scala.None$.get(Option.scala:347)
	at scala.None$.get(Option.scala:345)
	at org.apache.spark.status.api.v1.MetricHelper.submetricQuantiles(AllStagesResource.scala:313)
	at org.apache.spark.status.api.v1.AllStagesResource$$anon$1.build(AllStagesResource.scala:178)
	at org.apache.spark.status.api.v1.AllStagesResource$.taskMetricDistributions(AllStagesResource.scala:181)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$taskSummary$1.apply(OneStageResource.scala:71)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$taskSummary$1.apply(OneStageResource.scala:62)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$withStageAttempt$1.apply(OneStageResource.scala:130)
	at org.apache.spark.status.api.v1.OneStageResource$$anonfun$withStageAttempt$1.apply(OneStageResource.scala:126)
	at org.apache.spark.status.api.v1.OneStageResource.withStage(OneStageResource.scala:97)
	at org.apache.spark.status.api.v1.OneStageResource.withStageAttempt(OneStageResource.scala:126)
	at org.apache.spark.status.api.v1.OneStageResource.taskSummary(OneStageResource.scala:62)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.glassfish.jersey.server.model.internal.ResourceMethodInvocationHandlerFactory$1.invoke(ResourceMethodInvocationHandlerFactory.java:81)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher$1.run(AbstractJavaResourceMethodDispatcher.java:144)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.invoke(AbstractJavaResourceMethodDispatcher.java:161)
	at org.glassfish.jersey.server.model.internal.JavaResourceMethodDispatcherProvider$TypeOutInvoker.doDispatch(JavaResourceMethodDispatcherProvider.java:205)
	at org.glassfish.jersey.server.model.internal.AbstractJavaResourceMethodDispatcher.dispatch(AbstractJavaResourceMethodDispatcher.java:99)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.invoke(ResourceMethodInvoker.java:389)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:347)
	at org.glassfish.jersey.server.model.ResourceMethodInvoker.apply(ResourceMethodInvoker.java:102)
	at org.glassfish.jersey.server.ServerRuntime$2.run(ServerRuntime.java:326)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:271)
	at org.glassfish.jersey.internal.Errors$1.call(Errors.java:267)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:315)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:297)
	at org.glassfish.jersey.internal.Errors.process(Errors.java:267)
	at org.glassfish.jersey.process.internal.RequestScope.runInScope(RequestScope.java:317)
	at org.glassfish.jersey.server.ServerRuntime.process(ServerRuntime.java:305)
	at org.glassfish.jersey.server.ApplicationHandler.handle(ApplicationHandler.java:1154)
	at org.glassfish.jersey.servlet.WebComponent.serviceImpl(WebComponent.java:473)
	... 28 more
[Stage 2:=============================>                            (8 + 8) / 16]18/03/08 17:14:46

[Stage 7:========================================>               (72 + 8) / 100]18/03/08 17:28:55
                                                                             
Top 50 similar movies for Star Wars: Episode IV - A New Hope (1977)
Star Wars: Episode V - The Empire Strikes Back (1980)	score: 0.9897917106566659	strength: 2355
Raiders of the Lost Ark (1981)	score: 0.9855548278565054	strength: 1972
Star Wars: Episode VI - Return of the Jedi (1983)	score: 0.9841248359926177	strength: 2113
Indiana Jones and the Last Crusade (1989)	score: 0.9774440028650038	strength: 1397
Shawshank Redemption, The (1994)	score: 0.9768332708746131	strength: 1412
Usual Suspects, The (1995)	score: 0.9766875136831684	strength: 1194
Godfather, The (1972)	score: 0.9759284503618028	strength: 1583
Sixth Sense, The (1999)	score: 0.974688767430798	strength: 1480
Schindlers List (1993)	score: 0.9746820121947888	strength: 1422
Terminator, The (1984)	score: 0.9745821991816754	strength: 1746
Back to the Future (1985)	score: 0.9743476892310179	strength: 1845
Fugitive, The (1993)	score: 0.9740503810950097	strength: 1429
Princess Bride, The (1987)	score: 0.9737384179609926	strength: 1657
Matrix, The (1999)	score: 0.9732130645719457	strength: 1908
Butch Cassidy and the Sundance Kid (1969)	score: 0.9731825975678353	strength: 1048
Hunt for Red October, The (1990)	score: 0.9731286559518592	strength: 1229
Casablanca (1942)	score: 0.9730078799612648	strength: 1113
Saving Private Ryan (1998)	score: 0.9729484985516464	strength: 1709
Ghostbusters (1984)	score: 0.9726721862046535	strength: 1447
Die Hard (1988)	score: 0.9724843514829112	strength: 1369
L.A. Confidential (1997)	score: 0.9722077641949141	strength: 1416
Toy Story (1995)	score: 0.9721270419610062	strength: 1382
Stand by Me (1986)	score: 0.9718025936506943	strength: 1212
Close Encounters of the Third Kind (1977)	score: 0.9717491756795117	strength: 1242
Monty Python and the Holy Grail (1974)	score: 0.9717238750026624	strength: 1248
Silence of the Lambs, The (1991)	score: 0.9714472073187363	strength: 1587
Wizard of Oz, The (1939)	score: 0.9713633100564869	strength: 1346
Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1963)	score: 0.9713269232938938	strength: 1149
One Flew Over the Cuckoos Nest (1975)	score: 0.9708527915400245	strength: 1125
Ferris Buellers Day Off (1986)	score: 0.9705811698208009	strength: 1073
Godfather: Part II, The (1974)	score: 0.9704073574007531	strength: 1246
Terminator 2: Judgment Day (1991)	score: 0.9703674024729073	strength: 1889
E.T. the Extra-Terrestrial (1982)	score: 0.9702456868065551	strength: 1714
[hadoop@ip-172-31-67-129 ~]$ exit
logout
Connection to ec2-34-236-254-148.compute-1.amazonaws.com closed.
```