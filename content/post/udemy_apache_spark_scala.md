---
author: "Andrew Goss"
date: 2018-02-02
title: Udemy- Apache Spark 2.0 With Scala
tags:
  - spark
  - scala
  - self-study
---
![Spark_Scala](/img/post/spark_scala.png "Spark_Scala")<br>
<a href="https://www.udemy.com/apache-spark-with-scala-hands-on-with-big-data" target="_blank">COURSE LINK</a><br>
<a href="http://sundog-education.com/spark-scala" target="_blank">COURSE MATERIALS</a><br>
<hr>

### Description
* Learn the concepts of Spark's Resilient Distributed Datastores
* Get a crash course in the Scala programming language
* Develop and run Spark jobs quickly using Scala
* Translate complex analysis problems into iterative or multi-stage Spark scripts
* Scale up to larger data sets using Amazon's Elastic MapReduce service
* Understand how Hadoop YARN distributes Spark across computing clusters
* Practice using other Spark technologies, like Spark SQL, DataFrames, DataSets, Spark Streaming, and GraphX

<b>What am I going to get from this course?</b>

* Frame big data analysis problems as Apache Spark scripts
* Develop distributed code using the Scala programming language
* Optimize Spark jobs through partitioning, caching, and other techniques
* Build, deploy, and run Spark scripts on Hadoop clusters
* Process continual streams of data with Spark Streaming
* Transform structured data using SparkSQL and DataFrames
* Traverse and analyze graph structures using GraphX

### Target Audience
* Software engineers who want to expand their skills into the world of big data processing on a cluster

### What is Spark?
* A fast and general engine for large-scale data processing
* Runs programs up to 100x faster than Hadoop MapReduce in memory, or 10x faster on disk
* Built around one main concept: the Resilient Distributed Dataset (RDD) -- basically an abstraction over a giant set of data
  * Spark context - created by your driver program
  * Creates RDDs - responsible for making RDDs resilient and distributed!
  * Spark shell creates a "sc" object for you
  * Nothing actually happens in a RDD until you call an action on it -- lazy evaluation

### Why Scala for Spark?
* Spark itself is written in Scala
* Scala's functional programming model is a good fit for distributed processing
* Gives you fast performance (Scala compiles to Java bytecode)
* Less code & boilerplate stuff than Java
* Python is slow in comparison

### Datasets
<a href="https://grouplens.org/datasets/movielens" target="_blank">MovieLens</a>

#### Course Progress
<progress max="1.0" value="0.19"></progress>

19% - <font color="green">IN PROGRESS</font>

<a href="https://github.com/andrewrgoss/udemy-spark-scala" class="btn" target="_blank">View my code on GitHub</a><br><br>