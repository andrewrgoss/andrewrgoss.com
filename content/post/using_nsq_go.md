---
author: "Andrew Goss"
title: "Getting Started With NSQ for Go"
date: "2017-03-23"
tags:
  - "go"
  - "nsq"
---
<a href="http://nsq.io" target="_blank">![NSQ](/img/post/nsq.png "NSQ")</a><br>

I've been recently working on software application project at <a href="https://www.digitaslbi.com/en-us" target="_blank">DigitasLBi</a> where we adopted <a href="http://nsq.io" target="_blank">NSQ</a> as part of our microservices architecture. With this post I'd like to share how I got started using NSQ for <a href="https://golang.org" target="_blank">Go</a>. 

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

```go
package main

import (
	"log"
	"sync"

	"github.com/nsqio/go-nsq"
)

func main() {
	wg := &sync.WaitGroup{}
  	wg.Add(1)

	decodeConfig := nsq.NewConfig()
	c, err := nsq.NewConsumer("My NSQ Topic", "My NSQ Channel", decodeConfig)
	if err != nil {
        log.Panic("Could not create consumer")
    }
	//c.MaxInFlight defaults to 1

	c.AddHandler(nsq.HandlerFunc(func(message *nsq.Message) error {
		log.Println("NSQ message received:")
		log.Println(string(message.Body))
		return nil
	}))

	err = c.ConnectToNSQD(viper.GetString("nsq.ipaddr"))
	if err != nil {
		log.Panic("Could not connect")
	}
	log.Println("Awaiting messages from NSQ topic "+viper.GetString("nsq.topic")+"...")
	wg.Wait()
}
```

Now run this consumer program:

```bash
$ go run main.go
```

This should hang there waiting to receive a NSQ message from a topic you specify. Nothing will happen just yet since there aren't any queued up messages for this particular topic. Leave this program running in a terminal window for now. In the next step we'll push a message to it.

### <a name="producer"></a>Creating a Producer

You can publish a message with a producer with some simple code like this:

```go
package main

import (
  "log"

  "github.com/nsqio/go-nsq"
)

func main() {
	config := nsq.NewConfig()
	p, err := nsq.NewProducer("127.0.0.1:4150", config)
	if err != nil {
		log.Panic(err)
	}
	err = p.Publish("My NSQ Topic", []byte("sample NSQ message"))
	if err != nil {
		log.Panic(err)
	}
}
```