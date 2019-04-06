---
author: "Alex Woodie"
date: 2018-02-05
title: Why 2018 Will Be The Year Of The Data Engineer
tags:
  - career management
  - data engineering
---
![Data Pipe](/img/post/data_pipe.jpg "Data Pipe")<br>

<hr>
<sub><i>written by <a href="https://www.datanami.com/about" target="_blank">Alex Woodie</a></i>, Managing Editor of <a href="https://www.datanami.com" target=_>Datanami</a></sub>

The shortage of data scientists - those triple-threat types who possess advanced statistics, business, and coding skills - has been well-documented over the years. But increasingly, businesses are facing a shortage of another key individual on the big data team who's critical to achieving success - the data engineer.

> Data engineers are tasked with building and maintaining the pipes that serve up fresh and accurate data.

Data engineers are experts in designing, building, and maintaining the data-based systems in support of an organization's analytical and transactional operations. While they don't boast the quantitative skills that a data scientist would use to, say, build a complex machine learning model, data engineers do much of the other work required to support that data science workload, such as:

* Building data pipelines to collect data and move it into storage;
* Preparing the data as part of an ETL or ELT process;
* Stitching the data together with scripting languages;
* Working with the DBA to construct data stores;
* Ensuring the data is ready for use;
* Using frameworks and microservices to serve data.

In short, the job of the data engineer is to provide clean, reliable data to anybody in the business who needs it. He's more of a plumber with hands-on data expertise compared to data scientist's intellectual brilliance. If the data scientist is the one coming up with the grand plan to monetize new data sources, it's the data engineer who figures out how to build the pipelines to move the data, write transformations to cleanse the data, and implement services to ensure the data scientist has all the clean, reliable data she needs.

### Not Enough Engineers
Data engineers are critical when a company seeks to move its data science project into production. As such, there has recently been a run on data engineers - and Silicon Valley firms are leading the charge, says Tomer Shiran, the CEO and co-founder of <a href="http://www.dremio.com" target=_>Dremio</a>, a developer of big data middleware.

To run a successful data science project, it typically takes a ratio of one data engineer for every data scientist, Shiran says. "But even the hottest Silicon Valley companies are unable to achieve a one-to-two ratio," he says. "You don't have enough engineering talent out there. It's very expensive."

The complex technical nature of distributed data stores like Hadoop, Amazon S3, and Azure BLOB has increased the demand for data engineers because "by and large, really only the engineers have been able to get value out of the system," Shiran says. (Dremio's software was designed to enable analysts "be their own engineer," he says.)

> Data engineering job openings outnumber data science job openings by about four to one.

The shortage is pushing data engineers into high demand. A quick search for data engineering jobs on <a href="http://www.glassdoor.com" target=_>Glassdoor</a> found 107,730 data engineering jobs around the country. Most of those job listings had a starting pay in excess of $100,000 - and a few were over $150,000. By contrast, a search for data scientist yielded 21,760 jobs - many of which were also high paying. On the Indeed job board, there were 98,218 data engineer jobs posted, compared to 24,695 for data scientists - nearly a four-to-one ratio of data engineering jobs to data scientist jobs.

Kevin Safford, senior director of engineering at <a href="http://www.umbel.com" target=_>Umbel</a>, says engineering is a huge part of the value that Umbel brings to the sports franchises that utilize its data platform.

"If they tried to build this themselves, that would be a nightmare," Safford tells Datanami. "First off, they are not engineering companies. They are not software companies. It took us a long time and a lot of hard work from a lot of really smart people to build this once."

Umbel used a variety of open source and proprietary technologies (Spark, Cassandra, ElasticSearch, etc.) to build a database that tracks the sports-related metrics of consumers, including how they buy tickets, their social media behavior, brand interest, and demographic and psychographic profiles.

"We have tens of thousands of columns that could be associated to any particular individual, and there are 200 million of those people," Safford says. "And that's just an enormous amount of data. It's a humongous amount of data. Being able to just manage that data set is very difficult. But being able to make it available to have information retrieved from that and to have it happen quickly is especially hard. To say that's non-trivial is a bit of an understatement."

### Parallel Big Data Worlds

Craig Kelly, the group product manager at <a href="http://www.overstock.com" target=_>Overstock.com</a>, says there are two parallel worlds in data science - the data management side and the statistical side - but they often do not overlap. "When we looked at our data science group, they're all excellent data scientists," Kelly said. "But they're not heavy hitters on data engineering side."

To build its <a href="https://www.datanami.com/2017/12/18/inside-overstocks-one-one-marketing-machine" target=_>powerful one-to-one marketing machine</a>, Overstock.com had to overcome this data engineering shortage. It did it in part by adopting cloud-based data analytics solutions. "We didn't have enough resources on the data engineering side to support what we're trying to do, so we looked at <a href="http://www.snowflake.net" target=_>Snowflake</a> and <a href="http://www.databricks.com" target=_>Databricks</a> … [to] make up that shortfall - not on data engineering expertise, but on data engineering bandwidth, so the data scientists can do their work without having to lean too heavily on other groups."

Steve Wilkes, the CTO and founder of real-time streaming analytic software vendor <a href="http://www.striim.com" target=_>Striim</a>, says organizations are getting pickier about the data they collect, and as a result they're doing data integration work upfront instead of dumping it into a data lake. That's changing how they deploy their personnel and what they're asking they to do - in some cases, asking the data scientist to take on more of a data engineering role.

"What we're seeing more is the data scientist is getting involved in that initial data collection and starting to have more of a say in the data preparation side of thing - including doing in-memory data preparation, getting things in the right form, doing feature extraction - before it lands rather than after it lands," Wilkes says. "People have been burned by [throwing the data into a lake]. They get very frustrated because of how difficult it is to get value."

### Engineering Success

Umbel's Safford says the shortage of data engineering expertise can trip up even the best-conceived data science projects.

"You have to solve both of these problems in parallel to be successful, because if you spend a lot of time and effort and money managing your data and you can't take advantage of it, then it just becomes a tremendous headache and a huge cost," he says. "At the same time, if you don't take care to properly prepare and manage and maintain a data set that is especially useful to the problems you want to solve, your analytics team isn't doing any better than throwing darts."

Safford has seen many a data project go up in flames thanks to poorly implemented data engineering. "It is a fundamentally different kind of expertise to build a data application than it is to build even a very large scale web application," he says. "Just as you'd hire a contractor to build a deck or go to a mechanic to work on your care, you're not just paying to save your own time, but you're also paying to have an expert assure that you're not doing some things fundamentally wrong that you wouldn't even notice until down the line, and by that point you're in too deep and in a lot of trouble."

Organizations often assume they can pick up data engineering experience as they work their way through a project. They're usually wrong, Umbel says.

"If you don't have specific hard-earned, on-the-ground experience with building a data pipeline, a data management system, data analytics, and all of the intermediate code to make the data available and accessible and to assure that the data is correct, to assure that the analysis that you're' doing is correct," he says, "if you don't have that specific expertise, then it may seem like those are the types of things you can figure out as you go. And I've seen a lot of people make those assumptions. They're pretty much always wrong and they pretty much always make the same mistake."

<a href="https://www.datanami.com/2018/02/05/2018-will-year-data-engineer" class="btn" target="_blank">View original article</a><br>

<sub>*Source: <a href="https://www.datanami.com" target=_>Datanami</a></sub>