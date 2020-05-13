---
author: "Antony Henao"
date: 2020-05-07
title: Data Warehouse Pipelines- Basic Concepts & Roadmap
tags:
  - data engineering
  - data warehousing
  - data science
---

<sub><i>written by <a href="https://towardsdatascience.com/@ajhenaor" target="_blank">Antony Henao</a></i></sub>
<hr>

> Five processes to improve your data pipeline operability and performance

Building a data warehouse pipeline can be complex sometimes. If you are starting in this world, you will soon realize there is no <i>right or wrong way</i> to do it. It always depends on your needs.

Yet, there a couple of basic processes you should put in place when building a data pipeline to improve its operability and performance.

In this post, we intend to share you with <b>a roadmap that can help as a guide</b> when building a data warehouse pipeline.

This roadmap is intended to help people to implement <a href="https://medium.com/data-ops/what-is-dataops-ten-most-common-questions-ffc09c09c921" target=_>the DataOps philosophy</a> when building a data warehouse pipeline through a set of processes.

> <i><b>TL;DR</b> — In the roadmap section we talk about five processes that should be implemented to improve your data pipeline operability and performance — Orchestration, Monitoring, Version Control, CI/CD, and Configuration Management.

> Skip right to the roadmap section if you are already familiar with some of the data warehousing terminology — e.g., data lakes, data warehouses, batch, streaming, ETL, ELT, and so on.</i>

### Basic concepts
A good place to start in the data warehousing world is the book <a href="https://dataschool.com/data-governance" target=_>Cloud Data Management</a> by <a href="https://dataschool.com" target=_>The Data School</a>.

In this book, they introduce <a href="https://dataschool.com/data-governance/introduction-to-modern-data-governance" target=_>The 4 Stages of Data Sophistication</a>. These stages are a data-pipeline architectural pattern the data industry has been following for years.

### Basic Architecture
The basic architecture of a data warehouse pipeline can be split into four parts: <b><i>data sources, data lake, data warehouse, and data marts.</i></b>

<img src="/img/post/data_warehouse_pipeline_architecture.png" "Data Warehouse Pipeline Architecture" width="70%">

<sub><i>Data Warehouse Pipeline Architecture — Illustration by the Authors based on <a href="https://dataschool.com/data-governance/introduction-to-modern-data-governance" target=_>The 4 Stages of Data Sophistication</a></i></sub>

According to The Data School, these parts can be defined as follows:

* <b>Data sources:</b> The data coming from the business operation. This data comes from production databases, CRMs, APIs, and so on.

* <b>Data Lake:</b> "<i>A Data Lake is a storage repository of multiple sources of raw data in a single location</i>." The data can be found in several formats. Usually, the data can be usually unstructured and a little bit messy at this stage of the data pipeline.

 * <b>Data Warehouse:</b> "<i>A Data Warehouse (also commonly called a single source of truth) is a clean, organized, single representation of your data. Sometimes it’s a completely different data source, but increasingly it’s structured virtually, as a schema of views on top of an existing lake</i>."

* <>Data Marts:</b> "<i>A Data Mart is a filtered (and sometimes aggregated) subsection of a Data Warehouse to make it easier for a particular group to query data. It provides a smaller schema with only the relevant tables for the group</i>."

Together, these four parts represent the basic architecture of a data pipeline. The data is moved from data sources down to the data warehouse. This can be done in performing via <i>batch</i> or <i>stream</i> processing.

### Batch vs Streaming
Batch processing is based on loading the data in batches. This means, your data is loaded once per day, hour, and so on.

Stream processing is based on loading the data as it arrives. This is usually done using a <a href="https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern" target=_>Pub/Sub</a> system. So, in this way, you can load your data to the data warehouse <i>nearly in real-time</i>.

These two types of processing are not mutually exclusive. They may coexist in a data pipeline — see <a href="https://towardsdatascience.com/a-brief-introduction-to-two-data-processing-architectures-lambda-and-kappa-for-big-data-4f35c28005bb" target=_>Lambda and Kappa architectures</a> for more info. Particularly, we’ll focus on the <b>batch approach</b> in this post.

### ETL vs ELT processes
Batch processing implies moving the data from point A to point B. Processes allowing for doing such tasks are known as <b>ETL</b> processes — Extract, Load, and Transform.

These processes are based on extracting data from sources, transforming, and loading it to a data lake or data warehouse.

Although, in recent years, another approach has been introduced: the <b>ELT</b> approach.

The Data School states the difference between these two approaches is:

> <b>ETL</b> is the legacy way, where transformations of your data happen on the way to the lake.

> <b>ELT</b> is the modern approach, where the transformation step is saved until after the data is in the lake. The transformations really happen when moving from the Data Lake to the Data Warehouse.

> <i>ETL was developed when there were no data lakes; the staging area for the data that was being transformed acted as a virtual data lake. Now that storage and compute is relatively cheap, we can have an actual data lake and a virtual data warehouse built on top of it.</i>

<b>ELT</b> approach is preferred over <b>ETL</b> since it fosters best practices making easier data warehousing processes — <i>e.g.</i>, highly reproducible processes, simplification of the data pipeline architecture, and so on.

### Data Pipeline Roadmap
There are <b>five processes</b> we recommend you should put in place to improve your data pipeline operability and performance.

These processes are <i>Orchestration, Monitoring, Version Control, CI/CD, and Configuration Management.</i>

Such processes are defined based on the <a href="https://medium.com/data-ops/what-is-dataops-ten-most-common-questions-ffc09c09c921" target=_>DataOps philosophy</a>, which "<i>is a collection of technical practices, workflows, cultural norms, and architectural patterns</i>" enabling to reduce <a href="https://medium.com/data-ops/a-great-model-is-not-enough-deploying-ai-without-technical-debt-70e3d5fecfd3" target=_>technical debt</a> in the data pipeline — among other things.

<img src="/img/post/data_pipeline_roadmap.png" "Data Pipeline Roadmap" width="70%">

<sub><i>Data Pipeline Roadmap — Illustration by the Authors based on <a href="https://dataschool.com/data-governance/introduction-to-modern-data-governance" target=_>The 4 Stages of Data Sophistication</a></i></sub>

### Orchestration
We all have written CRON jobs for orchestrating data processes at some point in our lives.

When data is in the right place and it arrives at the expected time, everything runs smoothly. But, there is a problem. Things always go wrong at some point. When it happens everything is chaos.

Adopting better practices for handling data orchestration is necessary — e.g., retry policies, <a href="https://towardsdatascience.com/generalizing-data-load-processes-with-airflow-a4931788a61f" target=_>data orchestration process generalization</a>, process automation, task dependency management, and so on.

As your pipeline grows, so does the complexity of your processes. CRON jobs fall short for orchestrating a whole data pipeline. This is where <a href="https://en.wikipedia.org/wiki/Workflow_management_system" target=_>Workflow management systems</a> (WMS) step in. They are systems oriented <a href="https://medium.com/tech-quizlet/going-with-the-flow-how-quizlet-uses-apache-airflow-to-execute-complex-data-processing-pipelines-1ca546f8cc68" target=_>to support robust operations</a> allowing for orchestrating your data pipeline.

Some of the WMS used in the data industry are <a href="https://airflow.apache.org" target=_>Apache Airflow</a>, <a href="https://github.com/spotify/luigi" target=_>Luigi</a>, and <a href="https://azkaban.github.io" target=_>Azkaban</a>.

### Monitoring
Have you been in that position where all dashboards are down and business users come looking after for you to fix them? or maybe your DW is down you don’t know? That’s why you should always monitor your data pipeline!

Monitoring should be a <a href="https://www.infoworld.com/article/3231666/how-devops-changes-monitoring.html" target=_>proactive process, not just reactive</a>. So, if your dashboard or DW is down, you should know it before business users come looking out for you.

To do so, you should put in place monitoring systems. They run continuously to give you realtime insights about the health of your data pipeline.

Some tools used for monitoring are <a href="https://grafana.com" target=_>Grafana</a>, <a href="https://www.datadoghq.com" target=_>Datadog</a>, and <a href="https://prometheus.io" target=_>Prometheus</a>.

### CI/CD
Does updating changes in your data pipeline involve a lot of manual and error-prone processes to deploy them to production? If so, CI/CD is a solution for you.

CI/CD stands for <i>Continuous Integration and Continous Deployment</i>. The goal of CI is "<i>to establish a consistent and automated way to build, package, and test applications</i>". On the other hand, CD "<i>picks up where continuous integration ends. CD automates the delivery of applications to selected infrastructure environments</i>." — more info <a href="https://www.infoworld.com/article/3271126/what-is-cicd-continuous-integration-and-continuous-delivery-explained.html" target=_>here</a>.

CI/CD allows you to push changes to your data pipeline in an automated way. Also, it will reduce manual and error-prone work.

Some tools used for CI/CD are <a href="https://www.jenkins.io" target=_>Jenkins</a>, <a href="https://about.gitlab.com/stages-devops-lifecycle/continuous-integration" target=_>GitlabCI</a>, <a href="https://codeship.com" target=_>Codeship</a>, and <a href="https://travis-ci.org" target=_>Travis</a>.

### Configuration Management
So…Imagine your data pipeline infrastructure breaks down for any reason. For example, you need to deploy again the whole orchestration pipeline infrastructure. How you do it?

That’s where configuration management comes in. <a href="https://www.netapp.com/us/info/what-is-configuration-management.aspx" target=_>Configuration management</a> "<i>deals with the state of any given infrastructure or software system at any given time</i>." It fosters practices like <a href="https://en.wikipedia.org/wiki/Infrastructure_as_code" target=_>Infrastructure as Code</a>. Additionally, it deals with the whole configuration of the infrastructure — more info <a href="https://medium.com/formcept/configuration-management-and-continuous-deployment-cd0892dce998" target=_>here</a>.

Some tools used for Configuration Management are <a href="https://www.ansible.com" target=_>Ansible</a>, <a href="https://puppet.com" target=_>Puppet</a>, and <a href="https://www.terraform.io" target=_>Terraform</a>.

### Version control
Finally, one of the most known processes in the software industry: version control. We all have had problems when version control practices are not in place.

Version control manages changes in artifacts. It is an <a href="https://www.perforce.com/blog/vcs/what-is-version-control" target=_>essential process</a> for tracking changes in the code, iterative development, and team collaboration.

Some tools used for Version Control are <a href="https://github.com" target=_>Github</a>, <a href="https://about.gitlab.com" target=_>GitLab</a>, <a href="https://hub.docker.com" target=_>Docker Hub</a>, and <a href="https://dvc.org" target=_>DVC</a>.

### Conclusions
In this post, we recommended five processes you should put in place to improve your data pipeline operability and performance.

These processes are usually overlooked when implementing a data pipeline. We hope this information allows you to be aware of them.

More importantly, we expect this roadmap allows you to take your data pipeline to another level of operability!

<a href="https://towardsdatascience.com/building-a-data-warehouse-pipeline-basic-concepts-roadmap-d14032890ab6" class="btn" target="_blank">View original article</a><br>

<sub>*Source: <a href="https://www.medium.com" target=_>Medium</a></sub>