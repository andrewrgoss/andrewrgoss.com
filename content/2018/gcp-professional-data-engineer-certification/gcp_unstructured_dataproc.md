---
author: "Andrew Goss"
date: 2018-06-22
title: Coursera- Leveraging Unstructured Data with Cloud Dataproc on GCP
tags:
  - cloud computing
  - gcp
  - unstructured data
---
<a href="https://www.coursera.org/learn/leveraging-unstructured-data-dataproc-gcp" target=_><img src="/img/2018/gcp-professional-data-engineer-certification/gcp_unstructured_dataproc.jpg" "Leveraging Unstructured Data with Cloud Dataproc"></a><br>
<a href="https://www.coursera.org/learn/leveraging-unstructured-data-dataproc-gcp" target="_blank">COURSE LINK</a><br>
<a href="/2018/gcp-professional-data-engineer-certification/">GCP Professional Data Engineer Certification</a> >> <b>Leveraging Unstructured Data with Cloud Dataproc</b>
<hr>

## Module Lab Exercises

#### Module 1: Introduction to Cloud Dataproc
* Create a Dataproc Cluster
  * Prepare a bucket and a cluster initialization script
  * Create a Dataproc Hadoop Cluster customized to use Google Cloud API
  * Enable secure access to Dataproc cluster
  * Explore Hadoop operations

<img src="/img/2018/gcp-professional-data-engineer-certification/hadoop_operations.png" "Hadoop Operations" width="85%">
<img src="/img/2018/gcp-professional-data-engineer-certification/hadoop_datanode_info.png" "Hadoop Datanode Information" width="80%">

#### Module 2: Running Dataproc jobs
* Work with structured and semi-structured data
  * Use the Hive CLI and run a Pig job
  * Hive is used for structured data, similar to SQL
  * Pig is used for semi-structured data, similar to SQL + scripting
* Submit Dataproc jobs for unstructured data

#### Module 3: Leveraging GCP
* Leverage GCP
* Cluster automation using CLI commands

#### Module 4: Analyzing Unstructured Data
* Add Machine Learning

<font style="font-size:.8em;" color="#7f8c8d">Note: These exercises were spun up in temporary cloud instances and thus are no longer available for viewing.</font>
<hr>

### What Qualifies as Unstructured Data?
<img src="/img/2018/gcp-professional-data-engineer-certification/unstructured_data.png" "Unstructured Data" width="75%">

### Dataproc Eases Hadoop Management
<img src="/img/2018/gcp-professional-data-engineer-certification/gcp_dataproc_hadoop_mgmt.png" "Cloud Dataproc Versus Hadoop Alternatives" width="80%">

### Cloud Dataproc Architecture
<img src="/img/2018/gcp-professional-data-engineer-certification/gcp_dataproc_architecture.png" "Cloud Dataproc Architecture">
<img src="/img/2018/gcp-professional-data-engineer-certification/gcp_dataproc_architecture2.png" "Cloud Dataproc Architecture">

### Open-Source Tools on Dataproc
<img src="/img/2018/gcp-professional-data-engineer-certification/dataproc_open_source_tools.png" "Dataproc Open-Source Tools" width="60%">

### Data Center Power through GCP
<img src="/img/2018/gcp-professional-data-engineer-certification/gcp_datacenter_power.png" "Data Center Power through GCP" width="90%">

### Serverless Platform for Analytics Data Lifecycle Stages
<img src="/img/2018/gcp-professional-data-engineer-certification/analytics_data_lifecycle_serverless.png" "Serverless Platform for Analytics Data Lifecycle Stages" width="70%">

### Separation of Storage and Compute Enables Serverless
<img src="/img/2018/gcp-professional-data-engineer-certification/storage_compute_separation_serverless.png" "Separation of Storage and Compute Enables Serverless">

### Separation of Storage and Compute for Spark Programs
<img src="/img/2018/gcp-professional-data-engineer-certification/storage_compute_separation_spark.png" "Separation of Storage and Compute for Spark Programs">

### Module Review Notes
* Use Cloud storage instead of HDFS so you can shut down a Hadoop cluster when it is not actually running a job.
* Hive is designed for batch jobs and not for transactions. It ingests data into a data warehouse format requiring a schema. It does not support real-time queries, row-level updates, or unstructured data. Some queries may run much slower than others due to the underlying transformations Hive has to implement to simulate SQL.
* Pig provides SQL primitives similar to Hive, but in a more flexible scripting language format. Pig can also deal with semi-structured data, such as data having partial schemas, or for which the schema is not yet known. For this reason it is sometimes used for Extract Transform Load (ETL). It generates Java MapReduce jobs. Pig is not designed to deal with unstructured data.
* Spark has the ability to run both batch jobs and streaming jobs. It can use in-memory processing for fast results. RDDs or resilient distributed data sets hide the complexity of the location of data within the cluster and also the complexity of replication. 

### Resources