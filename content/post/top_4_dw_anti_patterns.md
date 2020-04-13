---
author: "Sean Knapp"
date: 2020-04-13
title: Top 4 Data Warehouse Anti-Patterns
tags:
  - data engineering
  - data warehousing
  - data science
---
<img src="/img/post/glass_panels.png" "Panels" width="70%">

<sub><i>Photo by <a href="https://www.ascend.io/blog/the-anti-pattern-in-big-data" target=_>Ascend blog</a> on <a href="https://www.ascend.io" target=_>Ascend.io</a></i></sub>

<sub><i>written by <a href="https://towardsdatascience.com/@seanknapp" target="_blank">Sean Knapp</a></i></sub>
<hr>

> When data warehouses are stretched outside of their core purpose, these once revered systems can put our data and our projects at risk. Below are the four most commonly found data warehouse anti-patterns.

<i>"The best investment is in the tools of one’s own trade."
— Benjamin Franklin</i>

The vast array of data, systems, and their interconnectedness continues to grow and is becoming increasingly complex. It comes as no surprise that the majority of data projects encounter significant delays if not outright failure, and this can often be traced back to the tools we use. There are a plethora of effective tools designed for the various stages of the data lifecycle, but when those tools are used incorrectly, projects are often doomed from the start.

<i>"If all you have is a hammer, everything looks like a nail."
— Maslow / Twain / Buddha</i>

Take data warehouses, for example. Data teams often rely on a data warehouse for its speed and ease. It’s a familiar environment to work in and, more importantly, it’s there. But after a bunch of one-off-turned-production uses and larger, more complex data transformations adding load to the system, what was once an easy environment to work in can become quite the opposite. When data warehouses are stretched outside of their core purpose, these once revered systems can put our data and our projects at risk.

Below are the four most commonly found data warehouse anti-patterns.

### Data warehouses used as data lakes
In the world of data today, data warehouses and data lakes are both widely used technologies — sometimes used in place of one another. But make no mistake: these technologies differ significantly. Organizations should be cautious when using these systems interchangeably.

Data warehouse cost, performance, and complexity increases significantly with the unnecessary addition of data that should reside elsewhere — such as data lakes, which are intended to store large amounts of data efficiently. These lakes support flexible processing for cleansing, modeling, and refining the data to make sense of it. On the other hand, data warehouses store refined data intended to support analytics, data applications, and machine learning projects.

Both systems offer similar functions and can, in fact, complement one another when used correctly. Data lakes provide the ability to flexibly operate, explore, and prepare data for downstream use cases. At which point, data warehouses then take that refined data and make it quickly available to users.

### Data warehouses used as data pipelines
ETL in data warehouses were great for structured data. However, when massive volumes of fast-moving, semi-structured and unstructured data is added into the mix, this process begins to break down quickly. The explosion of high variety, high volume and high velocity data have outgrown the capabilities of ETL making data pipelines an essential part of any modern data architecture. Data engineering teams have discovered that it can be extremely complex and time consuming to build. Data pipelines require heavy coding and a disproportionate amount of time for maintenance and optimizations. This has many developers turning to the data warehouse for that "last mile" of data transformation, instead of pipelines.

It’s easy to overload your warehouse with these transformations, but doing so results in a lot of data "pain" very quickly. Pushing the data and processing jobs to the warehouse requires a significant amount of compute power — which can get costly very quickly. Additionally, these jobs compete with resources for standard warehouse queries impacting performance for other downstream users and applications. While tools exist to alleviate some of this pain by incrementally caching portions of queries and their data, these methods also introduce a new wave of data integrity and lineage challenges that are problematic for most businesses today.

Instead, a number of data teams have now begun to offload their data warehouses and move processing into Apache Spark-based pipelines. This shift brings with it greater scale and efficiency that has both the data team and the CFO happy.

### Data warehouses used as the processing engine for data science
The current usability factors of large-scale data processing technologies has often forced data scientists to lean heavily on resource and cost-intensive data warehouses for core data science functionality. While these are the de facto systems for business intelligence and reporting, it’s essential data scientists do not limit themselves to only what warehouses can provide.

Data warehouses hold already structured data and are designed to quickly answer known questions about known data. However, given the cost and upfront modeling required, warehouses may not be an ideal system to run the type of experimentation and complex analysis required by data science teams seeking to find unknown patterns across a variety of data. Data scientists typically require systems with more fluidity and raw context than the heavily-modeled data sets found in a warehouse, in order to quickly iterate, experiment, and discover these unknowns to productionize as models. Additionally, more data is better for data scientists to drive better accuracy, which usually means larger volumes for which tools such as Apache Spark are better suited.

Data science is ultimately still a science; it’s driven by research, experimentation, testing, and repetition. To accomplish this, data scientists need more context, scalability, and affordability than data warehouses can provide to be able to build sufficiently accurate models at the speed the business requires.

### Data warehouses used as the primary tool for data development
Traditional data development lifecycles generally allow for only two places where you can transform data: as it is in transit from its place of origin, or upon querying it from its ultimate place of rest. However, modern data development lifecycles are far more fluid. Just as modern software applications are built with layers of micro-services and woven token via well-defined API calls, so too are modern data architectures increasingly moving to smaller, incremental, and iterative stages that can be well understood, maintained, and optimized.

In a modern data development lifecycle, not all data resides in the warehouse and users are forced to wait until data sets are configured to be delivered there. Not having access to raw and interim stages of data can be severely limiting for data teams, resulting in a slow iteration cycle. Moreover, requests for access to additional data sets or features often result in multi-week delays, putting projects, and sanities, at risk.

For an efficient and predictable DataOps strategy, active data development across all data stages must be made possible. While it’s been challenging in the past to maintain and manage security, job execution, and storage across these stages, there are new tools emerging that make this far easier and safer, ensuring data is accessible and collaborative no matter where it is in its lifecycle.

### Conclusion
Over the past few years, there has been significant innovation when it comes to data warehouse functionality. However, this can only carry us so far. At the end of the day, no matter how far we push and stretch data warehouses, they are purpose-built for refined, downstream usage. For scale, cost, and flexibility, it is difficult to beat data lakes and data pipelines, and recent innovations are making them faster and easier to use than ever before.

The world of data today is driven by powerful technology products, but make sure you’re using the right tools for the right users at every stage of the data development lifecycle for the best results.

<a href="https://towardsdatascience.com/top-4-data-warehouse-anti-patterns-6fe72a240ac4" class="btn" target="_blank">View original article</a><br>

<sub>*Source: <a href="https://www.medium.com" target=_>Medium</a></sub>