---
author: "Andrew Goss"
date: 2017-01-16
title: HDFS DCM Matchtables V2
tags:
  - hadoop
  - python
  - programming
---
![Hadoop](/img/post/hadoop.png "Hadoop")<br>
<a href="/projects/">Projects</a> >> <b>HDFS DCM Matchtables V2</b>
<hr>

# Overview
This is my code that pulls down daily DoubleClick Campaign Manager (DCM) log files (v2) from Google Cloud Storage (GCS) and loads them into Hadoop Distributed File System (HDFS) for use in Hive queries. The script fully replaces matchtable_v2 files with each day's new log file on HDFS. Match tables are demoed here, but it is imperative to frequently download other log files that change more often (ex. clicks and impressions on an hourly basis).  

## Google Cloud Storage
DCM v2 log files are stored in a bucket that this program accesses. Cloud Storage lets you store unstructured objects in containers called buckets. You can serve static data directly from Cloud Storage, or you can use it to store data for other Google Cloud Platform services. For more information, [click here](https://console.cloud.google.com/storage/browser).

## DCM data transfer files (log files) documentation
Documentation for v2 of the data transfer files can be found [here](https://developers.google.com/doubleclick-advertisers/udt/overview).

Other helpful docs:

* <a href="https://developers.google.com/doubleclick-advertisers/udt/reference/v1/file-format" target="_blank">DCM log file formats</a>
* [Match tables](https://developers.google.com/doubleclick-advertisers/udt/reference/v1/match-tables)
* [A mapping of old v1 data fields to the new v2 data fields.](https://developers.google.com/doubleclick-advertisers/udt/migrating)
* [gsutil](https://cloud.google.com/storage/docs/gsutil), a Python tool that facilitates command line access to GCS

<br class="custom"><a href="https://github.com/andrewrgoss/hdfs-dcm-matchtables_v2" class="btn" target="_blank">View my code on GitHub</a><br class="custom">