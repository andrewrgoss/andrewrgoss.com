---
author: "Gleb Mezhanskiy"
date: 2021-08-22
title: Modern Data Stack - Open-Source Edition
tags:
  - data engineering
  - elt
  - data warehousing
  - open source
---
<img src="/img/post/open_source_data_stack.png" "Open Source Data Stack" width="80%">

<hr>
<sub><i>written by Gleb Mezhanskiy</i></sub>

> <a href="https://www.datafold.com/blog/3-ways-to-be-wrong-about-open-source-software-for-data-warehousing" target=_>Open source is not by itself a compelling enough reason</a> to choose a technology for the data stack, but it can be the most feasible solution in some situations, for example, in a highly regulated industry or due to local privacy and data security legislation that may prohibit the use of foreign SaaS vendors.

The author of this post previously proposed a <a href="https://www.datafold.com/blog/dream-stack-for-analytics" target=_>data stack for a typical analytical use case</a> along with the key criteria to choose tech for each step in the data pipeline, such as minimal operational overhead, scalability, and pricing.

This article follows the steps in the data value chain. Organizations need data to make better decisions, either human (analysis) or machine (algorithms and machine learning). Before data can be used for that, it needs to go through a sophisticated multi-step process, which typically follows these steps:
<br class="custom">

1. <b>Specification: defining what to track (OSS in that area hasn’t evolved yet)</b>
2. <b>Instrumentation: registering events in your code</b>
3. <b>Collection: ingesting & processing events</b>
4. <b>Integration: adding data from various sources</b>
5. <b>Data Warehousing: storing, processing, and serving data</b>
6. <b>Transformation: preparing data for end users</b>
7. <b>Quality Assurance: bad data = bad decisions</b>
8. <b>Data discovery: finding the right data asset for the problem</b>
9. <b>Analysis: creating the narrative</b>

Most open-source products listed below are in fact open-core, i.e. primarily maintained and developed by teams that make money off consulting about, hosting, and offering “Enterprise” features for those technologies. In this post, we are not taking into account the features that are only available through the SaaS/Enterprise versions, thereby comparing only openly available solutions.

<a href="https://www.datafold.com/blog/the-modern-data-stack-open-source-edition" class="btn" target="_blank">Read more</a><br>

<sub>*Source: <a href="https://www.datafold.com" target=_>Datafold</a></sub>