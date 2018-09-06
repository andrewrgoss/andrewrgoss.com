---
author: "Andrew Goss"
date: 2018-09-06
title: A Data Engineer's Guide To Non-Traditional Data Storages
tags:
  - data analysis
  - data engineering
---
<img src="https://uploads.toptal.io/blog/image/121546/toptal-blog-image-1481031425756-abf394348a623799ba8a34a5fa63e165.jpg" width="420"<br>

> For data engineers, the most important aspects of data storages are how they index, shard, and aggregate data.

<sub>This post originally appeared on <a href="https://www.toptal.com" target=_>Toptal</a> and was written by [Ken Hu](#ken_hu)</i>.</sub><hr>

## Data Engineering
With the rise of <a href="https://www.toptal.com/big-data" target=_>big data</a> and data science, many engineering roles are being challenged and expanded. One new-age role is <a href="http://blog.udacity.com/2014/12/data-analyst-vs-data-scientist-vs-data-engineer.html" target=_>data engineering</a>.

Originally, the purpose of data engineering was the loading of external data sources and the designing of databases (designing and developing pipelines to collect, manipulate, store, and analyze data).

It has since grown to support the volume and complexity of big data. So data engineering now encapsulates a wide range of skills, from web-crawling, data cleansing, distributed computing, and data storage and retrieval.

For data engineering and data engineers, data storage and retrieval is the critical component of the pipeline together with how the data can be used and analyzed.

In recent times, many new and different data storage technologies have emerged. However, which one is best suited and has the most appropriate features for data engineering?

Most engineers are familiar with SQL databases, such as PostgreSQL, MSSQL, and MySQL, which are structured in relational data tables with row-oriented storage.

Given how ubiquitous these databases are, we won’t discuss them today. Instead, we explore three types of alternative data storages that are growing in popularity and that have introduced different approaches to dealing with data.

Within the context of data engineering, these technologies are search engines, document stores, and columnar stores.

* <b>Search engines</b> excel at text queries. When compared to text matches in SQL databases, such as `LIKE`, search engines offer higher query capabilities and better performance out of the box.
* <b>Document stores</b> provide better data schema adaptability than traditional databases. By storing the data as individual document objects, often represented as JSONs, they do not require schema predefining.
* <b>Columnar stores</b> specialize in single column queries and value aggregations. SQL operations, such as `SUM` and `AVG`, are considerably faster in columnar stores, as data of the same column are stored closer together on the hard drive.

In this article, we explore all three technologies: <a href="https://www.elastic.co/products/elasticsearch" target=_>Elasticsearch</a> as a search engine, <a href="https://www.mongodb.com" target=_>MongoDB</a> as a document store, and <a href="https://aws.amazon.com/redshift" target=_>Amazon Redshift</a> as a columnar store.

By understanding alternative data storage, we can choose the most suitable one for each situation. To compare these technologies, we’ll examine how they index, shard, and aggregate data. Each data indexing strategy improves certain queries while hindering others. Knowing which queries are used most often can influence which data store to adopt. Sharding, a methodology by which databases divide its data into chunks, determines how the infrastructure will grow as more data is ingested. Choosing one that matches our growth plan and budget is critical. Finally, these technologies each aggregate its data very differently. When we are dealing with gigabytes and terabytes of data, the wrong aggregation strategy can limit the types and performances of reports we can generate.

As data engineers, we must consider all three aspects when evaluating different data storages.

## Contenders

### Search Engine: Elasticsearch
Elasticsearch quickly gained popularity among its peers for its scalability and ease of integration. Built on top of <a href="https://lucene.apache.org/core" target=_>Apache Lucene</a>, it offers a powerful, out-of-the-box text search and indexing functionality. Aside from the traditional search engine tasks, text search, and exact value queries, Elasticsearch also offers layered aggregation capabilities.

### Document Store: MongoDB
At this point, MongoDB can be considered the go-to NoSQL database. Its ease of use and flexibility quickly earned its popularity. MongoDB supports rich and adaptable querying for digging into complex documents. Often-queried fields can be sped up through indexing, and when aggregating a large chunk of data, MongoDB offers a multi-stage pipeline.

### Columnar Store: Amazon Redshift
Alongside the growth of NoSQL’s popularity, columnar databases have also gathered attention, especially for data analytics. By storing data in columns instead of the usual rows, aggregation operations can be executed directly from the disk, greatly increasing performance. A few years ago, Amazon rolled out its hosted service for a columnar store called Redshift.

## Indexing

### Elasticsearch’s Indexing Capability
In many ways, search engines are data stores that specialize in indexing texts. While other data stores create indices based on the exact values of the field, search engines allow retrieval with only a fragment of the (usually text) field.

By default, this retrieval is done automatically for every field through analyzers. An analyzer is a module that creates multiple index keys by evaluating the field values and breaking them down into smaller values. For example, a basic analyzer might examine “the quick brown fox jumped over the lazy dog” into words, such as “the,” “quick,” “brown,” “fox” and so on. This method enables users to find the data by searching for fragments within the results, ranked by how many fragments match the same document data. A more sophisticated analyzer could utilize <a href="https://en.wikipedia.org/wiki/Edit_distance" target=_>edit distances</a>, <a href="https://en.wikipedia.org/wiki/N-gram" target=_>n-grams</a>, and filter by <a href="https://en.wikipedia.org/wiki/Stop_words" target=_>stopwords</a>, to build a comprehensive retrieval index.

### MongoDB’s Indexing Capability
As a generic data store, MongoDB has a lot of flexibility for indexing data.

Unlike Elasticsearch, it only indexes the `_id` field by default, and we need to create indices for the commonly queried fields manually.

Compared to Elasticsearch, MongoDB’s text analyzer isn’t as powerful. But it does provide a lot of flexibility with indexing methods, from the compound and geospatial for optimal querying to the TTL and sparse for storage reduction.

### Redshift’s Indexing Capability
Unlike Elasticsearch, MongoDB, or even traditional databases, including PostgreSQL, Amazon Redshift does not support an indexing method.

Instead, it reduces its query time by maintaining a consistent sorting on the disk.

As users, we can configure an ordered set of column values as the table sort key. With the data sorted on the disk, Redshift can skip an entire block during retrieval if its value falls outside the queried range, heavily boosting performance.

## Sharding

### Elasticsearch’s Sharding Capability
Elasticsearch was built on top of Lucene to scale horizontally and be production ready.

Scaling is done by creating multiple Lucene instances (shards) and distributing them across multiple nodes (servers) within a cluster.

By default, each document is routed to its respective shard through its `_id` field.

During retrieval, the master node sends each shard a copy of the query before finally aggregating and ranking them for output.

### MongoDB’s Sharding Capability
Within a MongoDB cluster, there are three types of servers: router, config, and shard.

By scaling the router, servers can accept more requests, but the heavy lifting happens at the shard servers.

As with Elasticsearch, MongoDB documents are routed (by default) via `_id` to their respective shards. At the query time, the config server notifies the router, which shards the query, and the router server then distributes the query and aggregates the results.

### Redshift’s Sharding Capability
An Amazon Redshift cluster consists of one leader node, and several compute nodes.

The leader node handles the compilation and distribution of queries as well as the aggregation of intermediate results.

Unlike MongoDB’s router servers, the leader node is consistent and can’t be scaled horizontally.

While this creates a bottleneck, it also allows efficient caching of compiled execution plans for popular queries.

## Aggregating

### Elasticsearch’s Aggregating Capability
Documents within Elasticsearch can be bucketed by exact, ranged, or even temporal and geolocation values.

These buckets can be further grouped into finer granularity through nested aggregation.

Metrics, including means and standard deviations, can be calculated for each layer, which provides the ability to calculate a hierarchy of analyses within a single query.

Being a document-based storage, it does suffer the limitation of intra-document field comparisons.

For example, while it is good at filtering if a field followers is greater than 10, we cannot check if followers is greater than another field following.

As an alternative, we can inject scripts as custom predicates. This feature is great for one-off analysis, but performance suffers in production.

### MongoDB’s Aggregating Capability
The <a href="https://docs.mongodb.com/manual/core/aggregation-pipeline" target=_>Aggregation Pipeline</a> is powerful and fast. As its name suggests, it operates on returned data in a stage-wise fashion. Each step can filter, aggregate and transform the documents, introduce new metrics, or unwind previously aggregated groups.

Because these operations are done in a stage-wise manner, and by ensuring documents and fields are reduced to only filtered, the memory cost can be minimized. Compared to Elasticsearch, and even Redshift, Aggregation Pipeline is an extremely flexible way to view the data. Despite its adaptability, MongoDB suffers the same lack of intra-document field comparison as Elasticsearch. Furthermore, some operations, including `$group`, require the results to be passed to the master node. Thus, they do not leverage the distributed computing.

Those unfamiliar with the stage-wise pipeline calculation will find certain tasks unintuitive. For example, summing up the number of elements in an array field would require two steps: first, the `$unwind`, and then the `$group` operation.

### Redshift’s Aggregating Capability
The benefits of Amazon Redshift cannot be understated.

Frustratingly slow aggregations on MongoDB while analyzing mobile traffic is quickly solved by Amazon Redshift.

Supporting SQL, traditional database engineers will have an easy time migrating their queries to Redshift.

Onboarding time aside, SQL is a proven, scalable, and powerful query language, supporting intra-document/row field comparisons with ease. Amazon Redshift further improves its performance by compiling and caching popular queries executed on the compute nodes.

As a relational database, Amazon Redshift does not have the schema flexibility that MongoDB and Elasticsearch have. Optimized for read operations, it suffers performance hits during updates and deletes.

To maintain the best read time, the rows must be sorted, adding extra operational efforts.

Tailored to those with petabyte-sized problems, it is not cheap and likely not worth the investment unless there are scaling problems with other databases.

## Picking the Winner
In this article, we examined three different technologies – Elasticsearch, MongoDB, and Amazon Redshift – within the context of data engineering. However, there is no clear winner as each of these technologies is a front-runner in its storage type category.

For data engineering, depending on the use case, some options are better than others.

* <b>MongoDB</b> is a fantastic starter database. It provides the flexibility we want when data schema is still to be determined. That said, MongoDB does not outperform specific use cases that other databases specialize in.
* While <b>Elasticsearch</b> offers a similar fluid schema to MongoDB, it is optimized for multiple indices and text queries at the expense of write performance and storage size. Thus, we should consider migrating to Elasticsearch when we find ourselves maintaining numerous indices in MongoDB.
* <b>Redshift</b> requires a predefined data schema, and is lacking the adaptability that MongoDB provides. In return, it outclasses other databases for queries only involving single (or a few) columns. When the budget permits, Amazon Redshift is a great secret weapon when others cannot handle the data quantity.

<hr>
<h4>About the Author - Ken Hu</h4><a name="ken_hu"></a>

Ken is a data and machine learning engineer. He has professional experiences in data pipelines, microservices, search engines, natural language processing, data analytics, and artificial intelligence. Python is his primary language. Ken often works in small to medium teams, acquiring an intuition to maximize efficiency with lower operation costs.

<a href="https://www.toptal.com/data-science/data-engineering-guide-to-storages" class="btn" target="_blank">View original article</a><br><br class="custom">