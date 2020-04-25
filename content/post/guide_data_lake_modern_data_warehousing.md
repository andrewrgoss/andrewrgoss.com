---
author: "Daniel Mateus Pires"
date: 2020-04-25
title: A Guide Data Lakes — Modern Batch Data Warehousing
tags:
  - big data
  - data engineering
  - data warehousing
---
<img src="/img/post/data_lake_waterfall.jpg" "Data Lake Waterfall" width="70%">

<hr>
<sub><i>written by <a href="https://towardsdatascience.com/@dmateusp" target="_blank">Daniel Mateus Pires</a></i></sub>

> Redefining the batch data extraction patterns and the data lake using “Functional Data Engineering”

The last decades have been greatly transformative for the Data Analytics landscape. With the decrease in storage costs and the adoption of cloud computing, the restrictions that guided the design of data tools were made obsolete and so — the data engineering tools and techniques <b>had</b> to evolve.

The author of this article, <a href="https://towardsdatascience.com/@dmateusp" target="_blank">Daniel Mateus Pires</a>, suspects that many data teams are taking on complex projects to modernize their data engineering stack and use the new technologies at their disposal. Many others are designing new data ecosystems from scratch in companies pursuing new business opportunities made possible by advances in Machine Learning and Cloud computing.

A <i>pre</i>-<a href="https://hadoop.apache.org" target=_>Hadoop</a> batch data infrastructure was typically made of a Data Warehouse (DW) appliance tightly coupled with its storage (e.g. Oracle or Teradata DW), an Extract Transform Load (ETL) tool (e.g. SSIS or Informatica) and a Business Intelligence (BI) tool (e.g. Looker or MicroStrategy). The philosophy and design principles of the Data organization, in this case were driven by well-established methodologies as outlined in books such as Ralph Kimball’s <i>The Data Warehouse Toolkit</i> (1996) or Bill Inmon’s <i>Building The Data Warehouse</i> (1992).

Daniel contrasts this approach to its <b>modern</b> version that was born of Cloud technology innovations and reduced storage costs. In a modern stack, the roles that were handled by the Data Warehouse appliance are now handled by <b>specialized</b> components like, file formats (e.g. <a href="http://parquet.apache.org" target=_>Parquet</a>, <a href="https://avro.apache.org" target=_>Avro</a>, <a href="https://hudi.incubator.apache.org" target=_>Hudi</a>), cheap cloud storage (e.g. <a href="https://aws.amazon.com/s3" target=_>AWS S3</a>, <a href="https://cloud.google.com/storage" target=_>GS</a>), metadata engines (e.g. <a href="https://hive.apache.org" target=_>Hive</a> metastore), query/compute engines (e.g. Hive, <a href="https://prestosql.io" target=_>Presto</a>, <a href="https://impala.apache.org" target=_>Impala</a>, <a href="https://spark.apache.org" target=_>Spark</a>) and optionally, cloud-based DWs (e.g. <a href="https://www.snowflake.com" target=_>Snowflake</a>, <a href="https://aws.amazon.com/redshift" target=_>Redshift</a>). Drag and drop ETL tools are less common, instead, a scheduler/orchestrator (e.g. <a href="https://airflow.apache.org" target=_>Airflow</a>, <a href="https://luigi.readthedocs.io/en/stable" target=_>Luigi</a>) and “ad-hoc” software logic take on this role. The “ad-hoc” ETL software is sometimes found in separate applications and sometimes within the scheduler framework which is <b>extensible</b> by design (Operator in Airflow, Task in Luigi). It often relies on external compute systems such as Spark clusters or DWs for heavy Transformation. The BI side also saw the rise of an open source alternative called <a href="https://superset.incubator.apache.org" target=_>Superset</a> sometimes complemented by <a href="https://druid.apache.org" target=_>Druid</a> to create roll-ups, Online analytical processing (OLAP) cubes and provide a fast read-only storage and query engine.

### Raison d’être
Daniel found himself working on a migration from a pre-Hadoop stack to a modern stack. It is not only a technology shift but also a major <b>paradigm shift</b>. In some cases, there are modeling and architectural decisions where we should distance ourselves from <i>outdated</i> wisdom and best practices, and it is important to understand why we are doing it. He found <a href="https://medium.com/u/9f4d525c99e2" target=_>Maxime Beauchemin</a>’s resources to be extremely helpful, and studying/understanding Apache Airflow’s design choices brings a lot of practical understanding in implementing the approach he advocates for (Airflow was created by Maxime). This guide aims to take an <i>opinionated</i> approach to defining and designing a Data Lake.

Daniel picks specific technologies to make this guide more <i>practical</i>, and hopes most of it is applicable to other tools in a modern stack. The motivations to pick a technology over another are generally a result of his experience (or lack thereof). For example, he mentions AWS tools because that is the cloud provider he has experience with.

This blog post defines the E of ETL, and describes the role of the <b>Data Lake</b>.

<a href="https://towardsdatascience.com/a-guide-to-modern-batch-data-warehousing-extraction-f63bfa6ef878" class="btn" target="_blank">Read more</a><br>

<sub>*Source: <a href="https://www.medium.com" target=_>Medium</a></sub>