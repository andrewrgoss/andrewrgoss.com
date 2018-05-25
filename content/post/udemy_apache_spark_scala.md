---
author: "Andrew Goss"
date: 2018-03-26
title: Udemy- Apache Spark 2.0 With Scala
tags:
  - spark
  - scala
  - self-study
---
![Spark_Scala](/img/post/spark_scala.png "Spark_Scala")<br>
<a href="https://www.udemy.com/certificate/UC-AI0N9YZG" target="_blank">COMPLETION CERTIFICATE</a><br>
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

<b>What I got from this course</b>

* Frame big data analysis problems as Apache Spark scripts
* Develop distributed code using the Scala programming language
* Optimize Spark jobs through partitioning, caching, and other techniques
* Build, deploy, and run Spark scripts on Hadoop clusters
* Process continual streams of data with Spark Streaming
* Transform structured data using SparkSQL and DataFrames
* Traverse and analyze graph structures using GraphX

### Target Audience
* Data engineers who want to expand their skills into the world of big data processing on a cluster

### What is Spark?
* A fast and general engine for large-scale data processing
* Runs programs up to 100x faster than Hadoop MapReduce in memory, or 10x faster on disk
* Built around one main concept: the Resilient Distributed Dataset (RDD) -- basically an abstraction over a giant set of data
  * Spark context - created by your driver program
  * Creates RDDs - responsible for making RDDs resilient and distributed!
  * Spark shell creates a "sc" object for you
  * Nothing actually happens in a RDD until you call an action on it -- lazy evaluation
  * Spark can do special stuff with key/value data (reduceByKey(), groupByKey(), sortByKey(), keys(), values())
  * You can do SQL-style joins on two key/value RDDs

### Why Scala for Spark?
* Spark itself is written in Scala
* Scala's functional programming model is a good fit for distributed processing
* Gives you fast performance (Scala compiles to Java bytecode)
* Less code & boilerplate stuff than Java
* Python is slow in comparison

### Key Concepts
<a href="https://www.hackerearth.com/practice/algorithms/graphs/breadth-first-search/tutorial" target="_blank">Breadth First Search (BFS)</a><br>

* Similarity metric algorithms:
  * Item-based collaborative filtering - used for recommending similar items by finding relationships based on user behavior
  * Pearson correlation coefficient
  * Jaccard coefficient
  * Conditional probability

<a href="https://stackoverflow.com/questions/25836316/how-dag-works-under-the-covers-in-rdd" target=_>How Directed Acyclic Graph (DAG) works</a> underneath the hood on Resilient Distributed Datasets (RDDs)

* RDD dataframes (for working with structured data): 
  * Contains row objects
  * Can run SQL queries
  * Has a schema (leading to more efficient storage)
  * Read and write to JSON, Hive, parquet
  * Communicates with JDBC/ODBC, Tableau

* <b>The trend in Spark is to use RDD's less, and DataSets more.</b>
* DataSets are more efficient
    * They can be serialized very efficiently - even better than Kryo
    * Optimal execution plans can be determined at compile time
* DataSets allow for better interoperability
    * MLLib and Spark Streaming are moving towards using DataSets instead of RDDs for their primary API
* DataSets simplify development
    * You can perform most SQL operations on a dataset with one line
* Structured streaming - uses DataSets as its primary API. Imagine a DataSet that keeps getting appended to forever and you can query it whenever you want.

### Datasets
<a href="https://grouplens.org/datasets/movielens" target="_blank">MovieLens</a>

### Hands-On Exercises
<a href="/projects/mov_sim_ml_1m_emr">Creating Similar Movies from One Million Ratings on EMR</a><br>
<a href="/projects/twitter_streaming">Twitter Streaming with Spark and Scala</a>

#### Course Progress
<progress max="1.0" value="1.0"></progress>

100% - completed 3/26/18.

<a href="https://github.com/andrewrgoss/udemy-spark-scala" class="btn" target="_blank">View my code on GitHub</a><br class="custom">