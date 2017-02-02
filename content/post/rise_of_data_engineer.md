---
author: "Andrew Goss"
title: "The Rise of the Data Engineer"
date: "2017-02-03"
tags:
  - "data engineering"
---
<sub><i>written by <a href="https://medium.freecodecamp.com/@maximebeauchemin" target="_blank">Maxime Beauchemin</a></i></sub>

### Data Engineering?
Data science as a discipline was going through its adolescence of self-affirming and defining itself. At the same time, data engineering was the slightly younger sibling, but it was going through something similar. The data engineering discipline took cues from its sibling, while also defining itself in opposition, and finding its own identity.

Like data scientists, data engineers write code. They're highly analytical, and are interested in data visualization.

Unlike data scientists--and inspired by our more mature parent, software engineering--data engineers build tools, infrastructure, frameworks, and services. In fact, it's arguable that data engineering is much closer to software engineering than it is to a data science.

In relation to previously existing roles, the data engineering field could be thought of as a superset of business intelligence and data warehousing that brings more elements from software engineering. This discipline also integrates specialization around the operation of so called "big data" distributed systems, along with concepts around the extended Hadoop ecosystem, stream processing, and in computation at scale.

In smaller companies--where no data infrastructure team has yet been formalized--the data engineering role may also cover the workload around setting up and operating the organization's data infrastructure. This includes tasks like setting up and operating platforms like Hadoop/Hive/HBase, Spark, and the like.

In smaller environments people tend to use hosted services offered by Amazon or Databricks, or get support from companies like Cloudera or Hortonworks--which essentially subcontracts the data engineering role to other companies.

In larger environments, there tends to be specialization and the creation of a formal role to manage this workload, as the need for a data infrastructure team grows. In those organizations, the role of automating some of the data engineering processes falls under the hand of both the data engineering and data infrastructure teams, and it's common for these teams to collaborate to solve higher level problems.

While the engineering aspect of the role is growing in scope, other aspects of the original business engineering role are becoming secondary. Areas like crafting and maintaining portfolios of reports and dashboards are not a data engineer's primary focus.

We now have better self-service tooling where analysts, data scientist and the general "information worker" is becoming more data-savvy and can take care of data consumption autonomously.

### ETL is changing
We've also observed a general shift away from drag-and-drop ETL (Extract Transform and Load) tools towards a more programmatic approach. Product know-how on platforms like Informatica, IBM Datastage, Cognos, AbInitio or Microsoft SSIS isn't common amongst modern data engineers, and being replaced by more generic software engineering skills along with understanding of programmatic or configuration driven platforms like Airflow, Oozie, Azkabhan or Luigi. It's also fairly common for engineers to develop and manage their own job orchestrator/scheduler.

There's a multitude of reasons why complex pieces of software are not developed using drag and drop tools: it's that ultimately code is the best abstraction there is for software. While it's beyond the scope of this article to argue on this topic, it's easy to infer that these same reasons apply to writing ETL as it applies to any other software. Code allows for arbitrary levels of abstractions, allows for all logical operation in a familiar way, integrates well with source control, is easy to version and to collaborate on. The fact that ETL tools evolved to expose graphical interfaces seems like a detour in the history of data processing, and would certainly make for an interesting blog post of its own.

Let's highlight the fact that the abstractions exposed by traditional ETL tools are off-target. Sure, there's a need to abstract the complexity of data processing, computation and storage. But I would argue that the solution is not to expose ETL primitives (like source/target, aggregations, filtering) into a drag-and-drop fashion. The abstractions needed are of a higher level.

For example, an example of a needed abstraction in a modern data environment is the configuration for the experiments in an A/B testing framework: what are all the experiment? what are the related treatments? what percentage of users should be exposed? what are the metrics that each experiment expects to affect? when is the experiment taking effect? In this example, we have a framework that receives precise, high level input, performs complex statistical computation and delivers computed results. We expect that adding an entry for a new experiment will result in extra computation and results being delivered. What is important to note in this example is that the input parameters of this abstraction are not the one offered by a traditional ETL tool, and that a building such an abstraction in a drag and drop interface would not be manageable.

To a modern data engineer, traditional ETL tools are largely obsolete because logic cannot be expressed using code. As a result, the abstractions needed cannot be expressed intuitively in those tools. Now knowing that the data engineer's role consist largely of defining ETL, and knowing that a completely new set of tools and methodology is needed, one can argue that this forces the discipline to rebuild itself from the ground up. New stack, new tools, a new set of constraints, and in many cases, a new generation of individuals.

### Data modeling is changing

Typical data modeling techniques--like the star schema--which defined our approach to data modeling for the analytics workloads typically associated with data warehouses, are less relevant than they once were. The traditional best practices of data warehousing are loosing ground on a shifting stack. Storage and compute is cheaper than ever, and with the advent of distributed databases that scale out linearly, the scarcer resource is engineering time.

Here are some changes observed in data modeling techniques:

* further denormalization: maintaining surrogate keys in dimensions can be tricky, and it makes fact tables less readable. The use of natural, human readable keys and dimension attributes in fact tables is becoming more common, reducing the need for costly joins that can be heavy on distributed databases. Also note that support for encoding and compression in serialization formats like Parquet or ORC, or in database engines like Vertica, address most of the performance loss that would normally be associated with denormalization. Those systems have been taught to normalize the data for storage on their own.
* blobs: modern databases have a growing support for blobs through native types and functions. This opens new moves in the data modeler's playbook, and can allow for fact tables to store multiple grains at once when needed

* dynamic schemas: since the advent of map reduce, with the growing popularity of document stores and with support for blobs in databases, it's becoming easier to evolve database schemas without executing DML. This makes it easier to have an iterative approach to warehousing, and removes the need to get full consensus and buy-in prior to development.

* systematically snapshoting dimensions (storing a full copy of the dimension for each ETL schedule cycle, usually in distinct table partitions) as a generic way to handle slowly changing dimension (SCD) is a simple generic approach that requires little engineering effort, and that unlike the classical approach, is easy to grasp when writing ETL and queries alike. It's also easy and relatively cheap to denormalize the dimension's attribute into the fact table to keep track of its value at the moment of the transaction. In retrospect, complex SCD modeling techniques are not intuitive and reduce accessibility.

* conformance, as in conformed dimensions and metrics is still extremely important in modern data environment, but with the need for data warehouses to move fast, and with more team and roles invited to contribute to this effort, it's less imperative and more of a tradeoff. Consensus and convergence can happen as a background process in the areas where the pain point of divergence become out-of-hand.

Also, more generally, it's arguable to say that with the commoditization of compute cycles and with more people being data-savvy then before, there's less need to precompute and store results in the warehouse. For instance you can have complex Spark job that can compute complex analysis on-demand only, and not be scheduled to be part of the warehouse.

### Roles & responsibilities

#### The data warehouse

<i>A data warehouse is a copy of transaction data specifically structured for query and analysis.</i>  --Ralph Kimball

<i>A data warehouse is a subject-oriented, integrated, time-variant and non-volatile collection of data in support of management's decision making process.</i>  --Bill Inmon

The data warehouse is just as relevant as it ever was, and data engineers are in charge of many aspects of its construction and operation. The data engineer's focal point is the data warehouse and gravitates around it.

The modern data warehouse is a more public institution than it was historically, welcoming data scientists, analysts, and software engineers to partake in its construction and operation. Data is simply too centric to the company's activity to have limitation around what roles can manage its flow. While this allows scaling to match the organization's data needs, it often results in a much more chaotic, shape-shifting, imperfect piece of infrastructure.

The data engineering team will often own pockets of certified, high quality areas in the data warehouse. At Airbnb for instance, there's a set of "core" schemas that are managed by the data engineering team, where service level agreement (SLAs) are clearly defined and measured, naming conventions are strictly followed, business metadata and documentation is of the highest quality, and the related pipeline code follows a set of well defined best practices.

It also becomes the role of the data engineering team to be a "center of excellence" through the definitions of standards, best practices and certification processes for data objects. The team can evolve to partake or lead an education program sharing its core competencies to help other teams become better citizens of the data warehouse. For instance, Facebook has a "data camp" education program and Airbnb is developing a similar "Data University" program where data engineers lead session that teach people how to be proficient with data.

Data engineers are also the "librarians" of the data warehouse, cataloging and organizing metadata, defining the processes by which one files or extract data from the warehouse. In a fast growing, rapidly evolving, slightly chaotic data ecosystem, metadata management and tooling become a vital component of a modern data platform.

#### Performance tuning and optimization

With data becoming more strategic than ever, companies are growing impressive budgets for their data infrastructure. This makes it increasingly rational for data engineers to spend cycles on performance tuning and optimization of data processing and storage. Since the budgets are rarely shrinking in this area, optimization is often coming from the perspective of achieving more with the same amount of resources or trying to linearize exponential growth in resource utilization and costs.

Knowing that the complexity of the data engineering stack is exploding we can assume that the complexity of optimizing such stack and processes can be just as challenging. Where it can be easy to get huge wins with little effort, diminishing returns laws typically apply.

It's definitely in the interest of the data engineer to build [on] infrastructure that scales with the company, and to be resource conscious at all times.

#### Data Integration

Data integration, the practice behind integrating businesses and systems
through the exchange of data, is as important and as challenging as its ever
been. As Software as a Service (SaaS) becomes the new standard way for companies to operate, the need to synchronize referential data across these systems becomes increasingly critical. Not only SaaS needs up-to-date data to function, we often want to bring the data generated on their side into our data warehouse so that it can be analyzed along the rest of our data. Sure SaaS often have their own analytics offering, but are systematically lacking the perspective that the rest of you company's data offer, so more often than not it's necessary to pull some of this data back.

Letting these SaaS offering redefine referential data without integrating and sharing a common primary key is a disaster that should be avoided at all costs. No one wants to manually maintain two employee or customer lists in 2 different systems, and worst: having to do fuzzy matching when bringing their HR data back into their warehouse.

Worst, company executive often sign deal with SaaS providers without really
considering the data integration challenges. The integration workload is systematically downplayed by vendors to facilitate their sales, and leaves data engineers stuck doing unaccounted, under appreciated work to do. Let alone the fact that typical SaaS APIs are often poorly designed, unclearly documented and "agile": meaning that you can expect them to change without notice.

#### Services

Data engineers are operating at a higher level of abstraction and in some cases that means providing services and tooling to automate the type of work that data engineers, data scientists or analysts may do manually.

Here are a few examples of services that data engineers and data infrastructure engineer may build and operate.

* data ingestion: services and tooling around "scraping" databases, loading logs, fetching data from external stores or APIs, ...
* metric computation: frameworks to compute and summarize engagement, growth or segmentation related metrics
* anomaly detection: automating data consumption to alert people anomalous events occur or when trends are changing significantly
* metadata management: tooling around allowing generation and consumption of metadata, making it easy to find information in and around the data warehouse
* experimentation: A/B testing and experimentation frameworks is often a critical piece of company's analytics with a significant data engineering component to it
* instrumentation: analytics starts with logging events and attributes related to those events, data engineers have vested interests in making sure that high quality data is captured upstream
* sessionization: pipelines that are specialized in understand series of actions in time, allowing analysts to understand user behaviors

Just like software engineers, data engineers should be constantly looking to automate their workloads and building abstraction that allow them to climb the complexity ladder. While the nature of the workflows that can be automated differs depending on the environment, the need to automate them is common across the board.

### Required Skills
SQL mastery: if english is the language of business, SQL is the language of
data. How successful of a business man can you be if you don't speak good english? While generations of technologies age and fade, SQL is still standing strong as the lingua franca of data. A data engineer should be able to express any degree of complexity in SQL using techniques like "correlated subqueries" and window functions. SQL/DML/DDL primitives are simple enough that it should hold no secrets to a data engineer. Beyond the declarative nature of SQL, she/he should be able to read and understand database execution plans, and have an understanding of what all the steps are, how indices work, the different join algorithm and the distributed dimension within the plan.

Data modeling techniques: for a data engineer, entity-relationship modeling should be a cognitive reflex, along with a clear understanding of normalization, and have a sharp intuition around denormalization tradeoffs. The data engineer should be familiar with dimensional modeling and the related concepts and lexical field.

ETL design: writing efficient, resilient and "evolvable" ETL is key.

Architectural projections: like any professional in any given field of expertise, the data engineer needs to have a high level understanding of most of the tools, platforms, libraries and other resources at its disposal. The properties, use-cases and subtleties behind the different flavors of databases, computation engines, stream processors, message queues, workflow orchestrators, serialization formats and other related technologies. When designing solutions, she/he should be able to make good choices as to which technologies to use and have a vision as to how to make them work together.

<a href="https://medium.freecodecamp.com/the-rise-of-the-data-engineer-91be18f1e603" class="btn" target="_blank">View original article</a>

<sub>*Source: <a href="https://medium.freecodecamp.com" target=_>FreeCodeCamp</a></sub>