---
author: "Simon Späti"
date: 2019-01-17
title: Future of Data Warehousing
tags:
  - business intelligence
  - data engineering
  - data warehousing
---
![Bundle of Wires](/img/post/bundle_wires.jpg "Bundle of Wires")<br>

<sub><i>written by <a href="https://hackernoon.com/@sspaeti" target="_blank">Simon Späti</a> (with some grammatical edits by me)</i></sub>
<hr>

Today, there are 6,500 people on LinkedIn who call themselves data engineers according to <a href="https://www.stitchdata.com/resources/the-state-of-data-engineering" target=_>stitchdata.com</a>. In San Francisco alone, there are 6,600 job listings for this same title. The number of data engineers has doubled in the past year, but engineering leaders still find themselves faced with a significant shortage of data engineering talent. So is it really the future of data warehousing? What is data engineering? These questions and much more I want to answer in this blog post.

In <a href="https://en.wikipedia.org/wiki/Unicorn_%28finance%29" target=_>unicorn</a> companies like Facebook, Google, Apple where data is the fuel for the company, mostly in America, is where data engineers are mostly used. In Europe, the job title does not completely exist besides the startup mecca Berlin, Munich, etc. They are called or included in jobs like software engineer, big data engineer, business analyst, data analyst, data scientist and also the business intelligence engineer. Myself, I started as a business intelligence engineer and using more and more time on the engineering rather the business part, that’s why I am starting this blog from the data warehousing angle.

## What is a Data Warehouse?
What is data warehousing or what is a business intelligence engineer doing, and why are they using a data warehouse?

To use the analogy to a physical retail-type warehouse, <b>you want to sell very structured products in the most efficient way to your customers</b>. In a data warehouse (DWH) you have typically structured data and optimised them for business users to query. If you dig a little deeper, you offload data from the trucks in the back of the physical shop, before it gets sorted and structured into the warehouse for the customers to buy. In a DWH you basically do the same, just with data. As you see in the DWH architecture below, the offloading area in the back of the store is your <a href="https://en.wikipedia.org/wiki/Staging_%28data%29" target=_>stage area</a> where you store the source data from your operational systems or external data.

A traditional Data Warehouse architecture by <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Data_warehouse_overview.JPG/360px-Data_warehouse_overview.JPG" target=_>Wikipedia</a>:

<img src="/img/post/traditional_data_warehouse.jpeg" "Traditional Data Warehouse" width="60%">

The physical warehouse where the customers buying the articles is in a DWH normally the so-called <a href="https://en.wikipedia.org/wiki/Data_mart" target=_>data mart</a>. The data processed between each layer seen in the architecture above is called <a href="https://en.wikipedia.org/wiki/Extract,_transform,_load" target=_>ETL (Extract Transform Load)</a>. This is not to confuse with <a href="https://en.wikipedia.org/wiki/Extract,_load,_transform" target=_>ELT (Extract Load Transform)</a> which is the common mythology data lakes (more in my recent <a href="http://www.sspaeti.com/blog/data-warehouse-vs-data-lake-etl-vs-elt" target=_>post</a>). In a DWH you always transform to get data as clean and structured as possible.

## Why have a Data Warehouse?
Besides the obvious reasons of a shop explained above, a data warehouse gives you big advantages:

* In theory: <b>Integration</b> and <b>transformation</b> of raw data of an organization from <b>multiple sources</b> (mostly very structured like SAP, CRM, Excel, etc.) into meaningful and <b>useful information, historical stored</b>.
* In practice: Similar <b>a cockpit in an aeroplane</b> — All Measures and KPI’s are at one place in order to steer the plane and take the right decisions
* It allows businesses to make <b>better decisions</b> by accessing the data well structured
  * It helps to make informed <b>decisions</b> based on facts
  * It improves the efficiency of business operations
  * It enhances the <b>quality</b> of customer service
* The visual products from business intelligence based on top of a data warehouses are largely:
  * Ad hoc Reporting
  * Standard Reporting
  * Dashboards / Cockpits

## What is Data Engineering?
Data engineering is the less famous sibling of data science. Data science is growing like no tomorrow and so does data engineer, but much less heard. Compared to existing roles it would be a <b>software engineering plus business intelligence engineer including big data abilities</b> as the Hadoop ecosystem, streaming and computation at scale. Business creates more reporting artifacts themselves but with more data that needs to be collected, cleaned and updated near real-time and complexity is expanding every day. With that said more programmatic skills are needed similar to software engineering. <b>The emerging language at the moment is Python</b> (more on that [below](#python)) while used in engineering with tools alike Apache Airflow as well as data science with powerful libraries. Where today as a BI-engineer you use <a href="https://en.wikipedia.org/wiki/SQL" target=_>SQL</a> for almost everything except when using external data from an FTP-server for example. You would use bash and PowerShell in the nightly batch jobs. But this is no longer sufficient and because it gets a full-time job to develop and maintain all these requirement and rules (called pipelines), the data engineering is needed.

## The role of a data engineer
In order to get high quality and <b>frequently updated data sets</b>, it is important to distinguish between data pipelines that are <b>done and cleaned</b> by data engineers and all the others that are mostly exploratory. We at Airbus use a folder that is called "cleaned" and all data sets produced there are constantly updated, documented and of the highest quality. Based on these data sets you create your own. We use the data lake solution <a href="https://en.wikipedia.org/wiki/Palantir_Technologies" target=_>Palantir Foundry</a> (brand name of Airbus: <a href="http://www.airbus.com/newsroom/press-releases/en/2017/06/airbus-launches-new-open-aviation-data-platform--skywise--to-sup.html" target=_>Skywise</a>) which provides you with a map where you see the <a href="https://en.wikipedia.org/wiki/Data_lineage" target=_>data lineage</a> easily. <b>Documentation and metadata to each data set are crucial</b> as otherwise, you lose the overview of your data, which is also one main task of a data engineer.

### Services that a data engineer provides
Another important task or service which a data engineer provides is <b>automation</b> that data scientists or data analysts do manually. A good overview what task this includes are provided by <a href="https://medium.com/@maximebeauchemin" target=_>Maxime Beauchemin</a>, the founder of <a href="https://airflow.apache.org" target=_>Apache Airflow</a>, a tool that helps a data engineer to lift the majority of tasked mentioned:

* <b>data ingestion</b>: services and tooling around "scraping" databases, loading logs, fetching data from external stores or APIs, …
* <b>metric computation</b>: frameworks to compute and summarise engagement, growth or segmentation related metrics
* <b>anomaly detection</b>: automating data consumption to alert people anomalous events occur or when trends are changing significantly
* <b>metadata management</b>: tooling around allowing generation and consumption of metadata, making it easy to find information in and around the data warehouse
* <b>experimentation</b>: A/B testing and experimentation frameworks is often a critical piece of company’s analytics with a significant data engineering component to it
* <b>instrumentation</b>: analytics starts with logging events and attributes related to those events, data engineers have vested interests in making sure that high-quality data is captured upstream
* <b>dependencies</b>: pipelines that are specialized in understand series of actions in time, allowing analysts to understand user behaviours"

> While the nature of the workflows that can be automated differs depending on the environment, the need to automate them is common across the board.

<sub>- Maxime Beauchemin</sub>

## When is a data engineer needed?
I believe, that <b>not every company is in need of data engineers</b>. These skills are mostly required if the company either:

* has already a product that is fully web-based and therefore data-driven or
* the need or desire to analyse lots of data (Volume) from any kind of sources (Variety) and fast (Velocity) to get the insights (Value and Veracity) (see more about the <a href="https://www.xsnet.com/blog/updated-for-2017-the-vs-of-big-data-velocity-volume-value-variety-and-veracity" target=_>five V’s of Big Data</a>)


## Data engineer job description and skills
If English is the language of business, SQL is the language of data and Python the language of engineering. While technology disappears often, SQL is still here. This means you need a reliable understanding of:

* <b>SQL to a high level of complexity</b>
  * e.g. using <a href="https://en.wikipedia.org/wiki/SQL_window_function" target=_>window</a> and <a href="https://en.wikipedia.org/wiki/Aggregate_function" target=_>aggregate</a> functions, changing the structure of a database with <a href="https://en.wikipedia.org/wiki/Data_definition_language" target=_>DDL</a>, changing the data with <a href="https://en.wikipedia.org/wiki/Data_manipulation_language" target=_>DML</a>, fine tuning or reading database <a href="https://en.wikipedia.org/wiki/Query_plan" target=_>execution plans</a>, understanding how <a href="https://en.wikipedia.org/wiki/Database_index" target=_>indices</a> work
* <b>Data modelling techniques</b>: <a href="https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model" target=_>ERDs</a> and dimensional modelling
* Solid <a href="https://en.wikipedia.org/wiki/Extract,_transform,_load" target=_>ETL</a> understanding
* <b>Architectural projections</b>: needs to have a high-level understanding of most of the tools, platforms, libraries and other resources at its disposal
* Ability to connect the dots from source to destination with any <b>programming language</b> that does the job best. (Probably Python at the moment)

<a href="https://www.stitchdata.com/resources/reports/the-state-of-data-engineering" target=_>Stitchdata.com</a> anticipated that as company size increased, so would the focus on scaling-related skill. However, that’s not the story the data told. Instead, data engineers at larger companies tend to be more focused on "enterprise" skills like ETL, BI, and data warehousing, whereas data engineers at smaller companies focus more on core technologies:

<img src="https://cdn-images-1.medium.com/max/1760/0*PXbyhDUMD9A6zZ4h.">

<a name="python"></a>

## The tool language, Python
### The growth of major programming languages
Programming languages have always come and gone, but in the last couple of years, Python rises on top of the popularity. The question is why. One valid reason for sure is because of the rise of the data engineers but also the use of libraries for data science and data analytics.

<img src="https://cdn-images-1.medium.com/max/1760/0*0ALwC2gUPzHjCXYJ.">

According to the <a href="http://news.codecademy.com/why-learn-python/#.WqCQsORnCDo" target=_>Codeacademy</a> and their source data from <a href="https://stackoverflow.blog/2017/09/06/incredible-growth-python" target=_>Stack Overflow</a>, they say it’s connected to the rise of data science. This and <a href="https://en.wikipedia.org/wiki/Machine_learning" target=_>machine learning</a> were the biggest trends in tech 2017. Additionally, Python has become a go-to language for data analysis. With data-focused libraries like pandas, NumPy, and matplotlib, anyone familiar with Python’s syntax and rules can deploy it as a powerful tool to process, manipulate, and visualise data.

Related to the rise of data science and data engineering, it’s clear to me that Python is here to stay and it’s becoming the <b>Swiss Army Knife of programming languages</b>.

## Python for data engineers
But for what can you use Python in data engineering. For example, you use it for <b>data wrangling</b> (reshaping, aggregating, joining disparate sources, etc.) which mostly done with the library <a href="https://en.wikipedia.org/wiki/Pandas_%28software%29" target=_>Pandas<a>, small-scale ETL, API interaction (our presentation usually happens in Tableau which has Python APIs) and automation with <a href="https://airflow.apache.org" target=_>Apache Airflow</a>, which is also natively in Python.

> "Apache Airflow has several building blocks that allow Data Engineers to easily piece together pipelines to and from different sources. Because it is written in Python, Data Engineers find it easy to create ETL pipelines by just extending classes of Airflow’s DAG and Operator objects. And this allows us to write our own Python code to create any ETL we wish, with the structure given by Airflow. Airflow uses several packages mentioned all ready to do the job: <a href="http://boto.cloudhackers.com/en/latest" target=_>`boto`</a> for S3 handling, pandas for obvious advantages with data frames, `psycopg2` for popular integrations with Postgres and Redshift, and several more."

<a href="https://www.quora.com/profile/David-Dalisay" target=_><sub>- David Dalisay</sub></a>

## Business Intelligence Engineer vs Data Engineer
As already mentioned in further up, the data engineer has the skillset of a business intelligence engineer plus also solid programming and big data skills. I believe BI-engineers will transit over to a data engineer anyway, depending on the size of a company. But why? What is changing/has changed?

## What has changed
As the power of computers and especially the speed of the internet is growing, more data can be collected and needs to be analysed. Therefore many parameters around the data warehouse environment have or will change. Below the points that I see with most influence:

* Computers have gotten faster and <b>reports can be built directly on source data</b>, with no persistent layer needed for performance optimization - a semantic layer is enough
* <b>Business has no time to wait for ETL</b> to be finished during the night, data needs to refresh immediately (near real-time)
  * Keeping up with customer demand through new BI deployments
  * Older BI deployments cannot keep pace with success
  * "The main factors that drive development and deployment of new data warehouses are being agile, leveraging the cloud and the next generation of data (as it relates to real-time data, streaming data and data from IoT devices)." -<a href="https://www.cio.com/article/3245386/data-warehousing/the-data-warehouse-in-2018.html" target=_>Brian E. Thomas</a>
  * (Data warehouse automation can help here, read more in my recent posts)
* Structure needs to put in place after you collect data (<a href="https://www.sspaeti.com/blog/data-warehouse-vs-data-lake-etl-vs-elt" target=_>ELT instead of ETL</a>).
* Easy collaboration and exchange of data is needed
* <b>Governance getting more important</b> as more data is stored in order to have the full overview of the data, timeframe and quality
* New trends, tools, technologies and competitors are arising all the time, companies must be on top of that

## ETL is changing
Furthermore the way we do ETL is changing as well, as <a href="https://medium.com/@maximebeauchemin" target=_>Maxime Beauchemin</a>, data engineer at Airbnb writes: 

> Product know-how on platforms like Informatica, IBM Datastage, Cognos, AbInitio or Microsoft SSIS isn’t common amongst modern data engineers, and being replaced by more generic software engineering skills along with understanding of programmatic or configuration driven platforms like Airflow, Oozie, Azkabhan or Luigi. It’s also fairly common for engineers to develop and manage their own job orchestrator/scheduler." 

He is also saying that code is the best abstraction there is for software rather than using drag and drop tools (ETL-tools). Most important what I see as well, that the transformation logic is of a higher need and shouldn’t be locked away exclusively for BI developers.

## Data Modeling is changing
As you can’t change ETL without modelling differently, also this is changing:

* Further <a href="https://en.wikipedia.org/wiki/Denormalization" target=_>denormalization</a> for performance gains is mostly compensated with faster databases engines or cloud solutions.
* Maintaining <a href="http://www.kimballgroup.com/1998/05/surrogate-keys" target=_>surrogate keys</a> in dimensions can be tricky and not human-friendly as we prefer business keys.
With the popularity of document storage and cheap blobs in cloud storage, it is becoming easier to create and <b>develop database schemas dynamically</b> without writing <a href="https://en.wikipedia.org/wiki/Data_manipulation_language" target=_>DML-statements</a>.
* Systematically snapshoting dimension compared to handle complex and maybe counter-intuitive <a href="https://en.wikipedia.org/wiki/Slowly_changing_dimension" target=_>slowly changing dimension (SCD)</a> is a way to <b>simplify track changes</b> in a DWH. Is it also easy and relatively cheap to denormalise dimension’s attribute directly on the fact table to keep important information at the moment of the transaction.
* <a href="http://www.kimballgroup.com/data-warehouse-business-intelligence-resources/kimball-techniques/dimensional-modeling-techniques/conformed-dimension" target=_>Conformed dimensions</a> and conformance as in general is extremely important in nowadays data warehouse and data environments. But to be more collaborative and work on same objects it is a necessary trade-off to loosen it up.
* Other business departments are becoming more data-savvy than ever before. In that sense data needs to become more real-time rather than batch processing and precomputed calculations, this can be done more ad-hoc with new fast technologies like Spark that run complex jobs ad-hoc and on-demand.

## Education is changing
Facebook, Airbnb and other companies taking it a step into so-called "Data Camps or Data University" to educate internal employees in respect of data to get more data savvy.

## Conclusion
So after all, is the data engineer the new business intelligence engineer? I would say in the long run yes. I imagine that data warehouses — in any way — will always be a need for the business, where the data is fully structured and easily accessible. But how we build DWHs (or something similar) will change and therefore more engineering and data engineer resources will be needed.

> Originally published at <a href="https://www.sspaeti.com/blog/data-engineering-the-future-of-data-warehousing" target="_blank">sspaeti.com</a>  on March 8, 2018.<br>

<sub>*Source: <a href="https://hackernoon.com" target=_>Hacker Noon</a></sub>