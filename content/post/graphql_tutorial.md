---
author: "Andrew Goss"
date: 2019-05-04
title: GraphQL Tutorial with Ruby
tags:
  - api development
  - graphql
  - ruby
---
![RGraphQL with Ruby](/img/post/graphql_ruby.png "GraphQL with Ruby")<br>
<a href="https://www.howtographql.com" target="_blank">TUTORIAL LINK</a><br>
<hr>

<sub>*Source: <a href="https://www.howtographql.com" target=_>How To GraphQL</a></sub>

## Introduction
Most applications today have the need to fetch data from a server where that data is stored in a database. It’s the responsibility of the API to provide an interface to the stored data that fits an application’s needs.

> APIs have become ubiquitous components of software infrastructures. In short, an API defines how a client can load data from a server.

## What is GraphQL?
* New <b>API</b> standard that was invented and open-sourced by Facebook.
* Enables <b>declarative data fetching</b> where a client can specify exactly what data it needs from an API. 
* Instead of multiple endpoints that return fixed data structures, a GraphQL server only exposes a single endpoint and responds with precisely the data a client asked for. GraphQL responds to <b>queries</b>.

<img src="/img/post/graphql_process_flow_diagram.png" "GraphQL Process Flow Diagram" width="80%">

GraphQL is often confused with being a database technology. This is a misconception, GraphQL is a <i>query language</i> for APIs - not databases. In that sense it’s database agnostic and effectively can be used in any context where an API is used.

### A more efficient Alternative to REST
> 💡 Learn more about the top reasons to use GraphQL in <a href="https://www.prisma.io/blog/top-5-reasons-to-use-graphql-b60cfa683511" target=_>this blog post</a>.

<a href="https://en.wikipedia.org/wiki/Representational_state_transfer" target=_>REST</a> has been a popular way to expose data from a server. When the concept of REST was developed, client applications were relatively simple and the development pace wasn’t nearly where it is today. REST thus was a good fit for many applications. However, the API landscape has radically changed over the last couple of years. In particular, there are three factors that have been challenging the way APIs are designed:

1. Increased mobile usage creates need for efficient data loading
Increased mobile usage, low-powered devices and sloppy networks were the initial reasons why Facebook developed GraphQL. GraphQL minimizes the amount of data that needs to be transferred over the network and thus majorly improves applications operating under these conditions.

2. Variety of different frontend frameworks and platforms
The heterogeneous landscape of frontend frameworks and platforms that run client applications makes it difficult to build and maintain one API that would fit the requirements of all. With GraphQL, each client can access precisely the data it needs.

3. Fast development & expectation for rapid feature development
Continuous deployment has become a standard for many companies, rapid iterations and frequent product updates are indispensable. With REST APIs, the way data is exposed by the server often needs to be modified to account for specific requirements and design changes on the client-side. This hinders fast development practices and product iterations.

## GraphQL Core Concepts
### The Schema Definition Language (SDL)
GraphQL has its own type system that’s used to define the <i>schema</i> of an API. The syntax for writing schemas is called <a href="https://blog.graph.cool/graphql-sdl-schema-definition-language-6755bcb9ce51" target=_>Schema Definition Language</a> (SDL).

### Fetching Data with Queries
When working with REST APIs, data is loaded from specific endpoints. Each endpoint has a clearly defined structure of the information that it returns. This means that the data requirements of a client are effectively encoded in the URL that it connects to.

The approach that’s taken in GraphQL is radically different. Instead of having multiple endpoints that return fixed data structures, GraphQL APIs typically only expose <i>a single endpoint</i>. This works because the structure of the data that’s returned is not fixed. Instead, it’s completely flexible and lets the client decide what data is actually needed.

That means that the client needs to send more <i>information</i> to the server to express its data needs - this information is called a query.

### Writing Data with Mutations
Next to requesting information from a server, the majority of applications also need some way of making changes to the data that’s currently stored in the backend. With GraphQL, these changes are made using so-called mutations. There generally are three kinds of mutations:

* Creating new data
* Updating existing data
* Deleting existing data

Mutations follow the same syntactical structure as queries, but they always need to start with the `mutation` keyword.

### Realtime Updates with Subscriptions
Another important requirement for many applications today is to have a <i>realtime</i> connection to the server in order to get immediately informed about important events. For this use case, GraphQL offers the concept of <i>subscriptions</i>.

When a client <i>subscribes</i> to an event, it will initiate and hold a steady connection to the server. Whenever that particular event then actually happens, the server pushes the corresponding data to the client. Unlike queries and mutations that follow a typical “<i>request-response</i>-cycle”, subscriptions represent a <i>stream</i> of data sent over to the client.

Subscriptions are written using the same syntax as queries and mutations.

## Other Resources
* <a href="https://blog.graph.cool/graphql-server-basics-the-schema-ac5e2950214e" target=_>GraphQL Server Basics (Part I): GraphQL Schemas, TypeDefs & Resolvers Explained</a>
* <a href="https://blog.graph.cool/graphql-server-basics-the-network-layer-51d97d21861" target=_>GraphQL Server Basics (Part II): The Network Layer</a>
* <a href="https://blog.graph.cool/graphql-server-basics-demystifying-the-info-argument-in-graphql-resolvers-6f26249f613a" target=_>GraphQL Server Basics (Part III): Demystifying the `info` argument in GraphQL resolvers</a>

<a href="#" class="btn" target="_blank">View my code on GitHub</a><br class="custom">