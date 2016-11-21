---
author: "Andrew Goss"
date: 2016-10-18
title: Big Data University- Hadoop 101
tags:
  - big data
  - hadoop
---
![Hadoop](/img/post/hadoop.png "Hadoop")<br>
<a href="/2016/big-data-university--hadoop-101/">Big Data University- Hadoop 101</a> >> <a href="/page/big_data_university_hadoop_101/lesson_transcripts">Lesson Transcripts</a> >> <b>Unit_1_What_is_Hadoop_Part2</b>
<hr>

<iframe width="660" height="371" src="https://www.youtube.com/embed/PS5QSGAoLNw" frameborder="0" allowfullscreen></iframe>

This is a list of some other open source project related to Hadoop:

- Eclipse is a popular IDE donated by IBM to the open-source community
- Lucene is a text search engine library written in Java
- Hbase is a Hadoop database 
- Hive provides data warehousing tools to extract, transform and load (ETL) data, and query this data stored in Hadoop files
- Pig is a high level language that generates MapReduce code to analyze large data sets.
- Spark is a cluster computing framework 
- ZooKeeper is a centralized configuration service and naming registry for large distributed systems
- Ambari manages and monitors Hadoop clusters through an intuitive web UI
- Avro is a data serialization system 
- UIMA is the architecture for the development, discovery, composition and deployment for the analysis of unstructured data
- Yarn is a large-scale operating system for big data applications
- Mapreduce is a software framework for easily writing applications which processes vast amounts of data

Let's now talk about examples of Hadoop in action.

Early in 2011, Watson, a super computer developed by IBM competed in the popular Question and Answer show Jeopardy!. In that contest, Watson was successful in beating the two most winning Jeopardy players. Approximately 200 million pages of text were input using Hadoop to distribute the workload for loading this information into memory.

Once this information was loaded, Watson used other technologies for advanced search and analysis. In the telecommunication industry we have China Mobile, a company that built a Hadoop cluster to perform data mining on Call Data Records. China Mobile was producing 5-8 TB of these records daily. By using a Hadoop-based system they were able to process 10 times as much data as when using their old system, and at one fifth the cost.

In the media we have the New York Times which wanted to host on their website all public domain articles from 1851 to 1922. They converted articles from 11 million image files (4TB) to 1.5TB of PDF documents. This was implemented by one employee who ran a job in 24 hours on a 100-instance Amazon EC2 Hadoop cluster at a very low cost.

In the technology field we again have IBM with IBM ES2, and enterprise search technology based on Hadoop, Nutch, Lucene and Jaql. ES2 is designed to address unique challenges of enterprise search such as: - The Use of enterprise-specific vocabulary, abbreviations and acronyms ES2 can perform mining tasks to build Acronym libraries, Regular expression patterns, and Geo-classification rules.

There are also many internet or social network companies using Hadoop such as: Yahoo, Facebook, Amazon, eBay, Twitter, StumbleUpon, Rackspace, Ning, AOL, etc. Yahoo of course is the largest production user with an application running a Hadoop cluster consisting of about 10,000 Linux machines. Yahoo is also the largest contributor to the Hadoop open source project.

Now, Hadoop is not a magic bullet that solves all kinds of problems. Hadoop is not good to process transactions due to its lack random access. It is not good when the work cannot be parallelized or when there are dependencies within the data, that is, record one must be processed before record two. It is not good for low latency data access. Not good for processing lots of small files although there is work being done in this area, for example, IBM's Adaptive MapReduce. And it is not good for intensive calculations with little data.

Now let's move on, and talk about Big Data solutions. Big Data solutions are more than just Hadoop. They can integrate analytic solutions to the mix to derive valuable information that can combine structured legacy data with new unstructured data. 

Big data solutions may also be used to derive information from data in motion, for example, IBM has a product called InfoSphere Streams that can be used to quickly determine customer sentiment for a new product based on Facebook or Twitter comments.

Finally we would like to end this presentation with one final thought: Cloud computing has gained a tremendous track in the past few years, and it is a perfect fit for Big Data solutions. Using the cloud, a Hadoop cluster can be setup in minutes, on demand, and it can run for as long as needed without having to pay for more than what is used.