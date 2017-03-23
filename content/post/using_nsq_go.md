---
author: "Andrew Goss"
title: "Using NSQ With Go"
date: "2017-03-23"
tags:
  - "go"
  - "nsq"
---
<a href="http://nsq.io" target="_blank">![NSQ](/img/post/nsq.png "NSQ")</a><br>

I've been recently working on software application project at <a href="https://www.digitaslbi.com/en-us" target="_blank">DigitasLBi</a> where we adopted <a href="http://nsq.io" target="_blank">NSQ</a> as part of our microservices architecture. When I was learning how NSQ works and experimenting in <a href="https://golang.org" target="_blank">Go</a>, I didn't find a whole lot of (current) sample code out on the web. With this post I'd like to share how I got started using NSQ for Go.

## What is NSQ?

Per the official website, NSQ is a realtime distributed messaging platform designed to operate at scale, handling billions of messages per day.

It promotes distributed and decentralized topologies without single points of failure, enabling fault tolerance and high availability coupled with a reliable message delivery guarantee.

<img src="https://f.cloud.github.com/assets/187441/1700696/f1434dc8-6029-11e3-8a66-18ca4ea10aca.gif"></img>

`nsqd` is the daemon that receives, queues, and delivers messages to clients.

With the chart above you can understand the basic premise of NSQ involves producers and consumers - within your code you create NSQ producers to push messages to NSQ that get queued up to be consumed by other programs within your application.

## Installing NSQ (on Linux)

```bash
$ wget https://s3.amazonaws.com/bitly-downloads/nsq/nsq-1.0.0-compat.linux-amd64.go1.8.tar.gz
$ tar nsq-1.0.0-compat.linux-amd64.go1.8.tar.gz
$ sudo mv nsq-1.0.0-compat.linux-amd64.go1.8.tar.gz/bin/* /usr/local/bin
```

## Launching NSQD

```bash
$ nsqlookupd & 
$ nsqd --lookupd-tcp-address=127.0.0.1:4160 &
$ nsqadmin --lookupd-http-address=127.0.0.1:4161 &
```

If done successfully this will show web UI:

<img src="http://nsq.io/static/img/nsqadmin_screenshot.png"></img>

`nsqadmin` is a Web UI to view aggregated cluster stats in realtime and perform various administrative tasks.