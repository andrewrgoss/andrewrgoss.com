---
author: "Andrew Goss"
date: 2018-03-08
title: Creating Similar Movies from One Million Ratings on EMR
tags:
  - aws
  - big data
  - scala
  - spark

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
mymachine:~ andgoss$ ssh -i ~/.credentials/ag-spark.pem hadoop@ec2-34-236-254-148.compute-1.amazonaws.com
ssh: connect to host ec2-34-236-254-148.compute-1.amazonaws.com port 22: Operation timed out
```

To address this, I navigated to the security group for the master node of my EMR cluster (from the EMR summary tab). From here, I edited the inbound rules to add a new one to open up the port to SSH from my computer's IP address:

![Open SSH Port](/img/2018/udemy--apache-spark-2.0-with-scala/open_ssh_port_master_node.png "Open SSH Port")

Here is the terminal output from successfully running this Spark job across my (temporary) EMR cluster. I removed the repetitive warnings to make this more readable. Once this finished running I terminated this cluster through the AWS console.

{{< gist andrewrgoss 5121c78a3c98c7caac81146d2f8556a5 >}}