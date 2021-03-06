---
author: "Andrew Goss"
date: 2017-01-07
title: Big Data University- Hadoop 101
---
![Hadoop](/img/post/hadoop.png "Hadoop")<br>
<a href="/2017/big-data-university--hadoop-101/">Big Data University- Hadoop 101</a> >> <a href="/2017/big-data-university--hadoop-101/lesson_transcripts_labs">Lesson Transcripts/Labs</a> >> <b>Unit_1_What_is_Hadoop_Part1</b>
<hr>

<iframe width="660" height="371" src="https://www.youtube.com/embed/-65WgvIJ5xo" frameborder="0" allowfullscreen></iframe>

Hello everyone and welcome to Hadoop Fundamentals What is Hadoop. My name is Asma Desai and I will be covering this topic.

In this video we will explain what is Hadoop and what is Big Data. We will define some Hadoop-related open source projects and give some examples of Hadoop in action. Finally we will end off with some Big Data solutions and the Cloud.

Imagine this scenario: You have 1GB of data that you need to process.

The data is stored in a relational database in your desktop computer which has no problem handling the load. Then your company starts growing very quickly, and that data grows to 10GB, then 100GB, and you start to reach the limits of your current desktop computer.

So what do you do? You scale up by investing in a larger computer, and you are then OK for a few more months. When your data grows from 1 TB to 10TB, and then 100TB, you are again quickly approaching the limits of that computer.

Moreover, you are now asked to feed your application with unstructured data coming from sources like Facebook, Twitter, RFID readers, sensors, and so on. Your management wants to derive information from both the relational data and the unstructured data and wants this information as soon as possible. What should you do? Hadoop may be the answer.

What is Hadoop? Hadoop is an open source project of the Apache Foundation. It is a framework written in Java originally developed by Doug Cutting who named it after his son's toy elephant. Hadoop uses Google's MapReduce technology as its foundation. It is optimized to handle massive quantities of data which could be structured, unstructured or semi-structured, using commodity hardware, that is, relatively inexpensive computers.

This massive parallel processing is done with great performance. However, it is a batch operation handling massive amounts of data, so the response time is not immediate. Currently, in place updates are not possible in Hadoop, but appends to existing data is supported.

Now, what's the value of a system if the information it stores or retrieves is not consistent? Hadoop replicates its data across different computers, so that if one goes down, the data is processed on one of the replicated computers. Hadoop is not suitable for OnLine Transaction Processing workloads where data is randomly accessed on structured data like a relational database.

Also, Hadoop is not suitable for OnLine Analytical Processing or Decision Support System workloads where data is sequentially accessed on structured data like a relational database, to generate reports that provide business intelligence. As of Hadoop version 2.6, updates are not possible, but appends are possible. Hadoop is used for Big Data. It complements OnLine Transaction Processing and OnLine Analytical Processing. It is NOT a replacement for a relational database system.

So, what is Big Data? With all the devices available today to collect data, such as RFID readers, microphones, cameras, sensors, and so on, we are seeing an explosion in data being collected worldwide. Big Data is a term used to describe large collections of data (also known as datasets) that may be unstructured, and grow so large and quickly that it is difficult to manage with a regular database or statistical tools.

In terms of numbers, what are we looking at? How BIG is "big data"? Well there are more than 3.2 billion internet users, and active cell phones have surpassed 7.6 billion. There are now more in-use cell phones than there are people on the planet (7.4 billion).

Twitter processes 7TB of data ever day, and 600TB of data is processed by Facebook every day. Interestingly, about 80% of this data is unstructured. With this massive amount of data, businesses need fast, reliable, deeper data insight. Therefore, Big Data solutions based on Hadoop and other analytics software are becomingmore and more relevant.