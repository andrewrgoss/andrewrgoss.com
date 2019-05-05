---
author: "Andrew Goss"
title: "Getting Started With NSQ for Go"
date: "2017-03-23"
tags:
  - "golang"
  - "nsq"
  - "pub sub messaging"
---
<a href="http://nsq.io" target="_blank">![NSQ](/img/post/nsq.png "NSQ")</a><br>

I've been recently working on software application project at <a href="https://www.digitas.com" target="_blank">Digitas</a> where we adopted <a href="http://nsq.io" target="_blank">NSQ</a> as part of our microservices architecture. With this post I'd like to share how you can get started with NSQ by sending and receiving a simple message by writing some <a href="https://golang.org" target="_blank">Go</a> code.

## What is NSQ?

Per the official website, NSQ is a realtime distributed messaging platform designed to operate at scale, handling billions of messages per day.

It promotes distributed and decentralized topologies without single points of failure, enabling fault tolerance and high availability coupled with a reliable message delivery guarantee.

<img src="https://f.cloud.github.com/assets/187441/1700696/f1434dc8-6029-11e3-8a66-18ca4ea10aca.gif"></img>

`nsqd` is the daemon that receives, queues, and delivers messages to clients.

With the chart above you can understand the basic premise of NSQ involves producers and consumers - within your code you create NSQ producers to push messages to NSQ that get queued up to be consumed by other programs within your application.

## Installing NSQ (on Linux VM)

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

If done successfully you will be able to view a web UI that looks like this:

<img src="http://nsq.io/static/img/nsqadmin_screenshot.png"></img>

`nsqadmin` is a Web UI to view aggregated cluster stats in realtime and perform various administrative tasks.

## Writing Your Go Program

To import the NSQ client library, use a `go get` command:

```bash
$ go get github.com/nsqio/go-nsq
```

### Creating a Consumer

I like creating the consumer first so I can see the handler in action after pushing a message with a producer (see next [section](#producer)).

{{< gist andrewrgoss eba98ce6334d98a9f2f0b99cab62fd1f >}}

Now run this consumer program:

```bash
$ go run consume.go
```
You'll get this output:

```bash
2017/04/05 17:33:42 INF    1 [My_NSQ_Topic/My_NSQ_Channel] (127.0.0.1:4150) connecting to nsqd
2017/04/05 17:33:42 Awaiting messages from NSQ topic "My NSQ Topic"...
```

This should hang there waiting to receive a NSQ message from a topic you specify. Nothing will happen just yet since there aren't any queued up messages for this particular topic. Leave this program running in a terminal window for now. In the next step we'll push a message to it.

### <a name="producer"></a>Creating a Producer

You can publish a message with a producer with some simple code like this:

{{< gist andrewrgoss f0b2f20690730c0d8b0d65c23d5b7906 >}}

Now run this publisher program:

```bash
$ go run publish.go
```

In this terminal window, you'll only see this message indicating your message was published to NSQ:

```bash
go run publish.go
2017/04/05 17:39:15 INF    1 (127.0.0.1:4150) connecting to nsqd
```

If you look at your consumer terminal window that you left running from the previous step, you'll now see this additional output:

```bash
2017/04/05 17:33:42 Awaiting messages from NSQ topic "My NSQ Topic"...
2017/04/05 17:39:15 NSQ message received:
2017/04/05 17:39:15 sample NSQ message
```

Congrats - you just pushed and received your first NSQ message!

If you go back to your web UI console you'll see your newly-created topic. If you drill into this topic, you can also see the channel that you consumed the message to, with the message counter at 1:

![NSQ Topic](/img/post/nsq_topic.png "NSQ Topic")