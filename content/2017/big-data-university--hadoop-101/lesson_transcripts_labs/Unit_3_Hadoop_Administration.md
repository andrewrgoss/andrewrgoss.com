---
author: "Andrew Goss"
date: 2016-10-18
title: Big Data University- Hadoop 101
---
![Hadoop](/img/post/hadoop.png "Hadoop")<br>
<a href="/2017/big-data-university--hadoop-101/">Big Data University- Hadoop 101</a> >> <a href="/2017/big-data-university--hadoop-101/lesson_transcripts_labs">Lesson Transcripts/Labs</a> >> <b>Unit_3_Hadoop_Administration</b>
<hr>

<iframe width="660" height="371" src="https://www.youtube.com/embed/LtGliUam-_U" frameborder="0" allowfullscreen></iframe>

Welcome to the unit on Hadoop Administration. The agenda covers adding nodes to a cluster,
verifying the health of a cluster, and stopping / starting components. Then the unit covers
configuring Hadoop and setting up rack topology.
Let's begin with adding and removing nodes from a cluster.

Adding nodes can be performed from the Ambari Console. To do so requires either the ip address
or hostname of the node to be added. The node to be added must also be reachable. And as
a matter of fact, it works both ways. The master and child nodes must all be able to
communicate with each other. In this case, a child node refers to the node that is being
added. It may not have BigInsights already installed on it. When the node is added to
a cluster, the BigInsights code is transferred to the new node and installed.
From the Ambari Console you navigate to the Hosts tab and, on the left side, under Actions
select Add New Hosts. You are then presented with a dialog that allows you to specify one
or more nodes to be added. You may type in ip address, hostnames or any combination thereof.
You can even specify an ipaddress range or a regular expression with your hostname.
Once the nodes have been added, you define which services are to be hosted on those nodes.
You can select multiple services for one or more nodes.
Services can also be removed from a node.

As a matter of fact, if you are using the Ambari Console to remove a node, you must
first remove all services from that node. Depending on which services are running on
a node, you select which are to be removed. When there are no services running on a node,
it can be removed using the Ambari Console.
Next let us discuss verifying the heath of your cluster.
You are able to view all of the nodes in the cluster, see the status of each node and which
services are running on each node.
From the command line you can run the DFS Disk Check report. This lets you see how
much space is still available on each DataNode.

Next let us look at start and stopping components and services.
In order to save some resources, you may only want to start a subset of the Hadoop
components . Using Ambari, navigate to the Services tab and choose a service from the
left that you would like to stop or start. When the services main page appears on the
right side under Service Actions you can start or stop that service.
All services can be stopped or started from the main Dashboard
Now let us look at how to configure Hadoop.

Hadoop is configured using a number of XML files. And each file controls a number of
parameters. There are three main configuration files with which you will work.
core-site.xml is used to configure the parameters that are common to both HDFS and
MapReduce. hdfs-site.xml contains parameters that
are for the HDFS daemons, like the NameNode and DataNodes.
mapred-site.xml controls the settings for MapReduce daemons, JobTracker and TaskTrackers.
We are not going to spend the time covering all of the configuration files. That would
just take too much time. However, you do have the option of pausing this video if you would
like to read the descriptions of the other configuration files.

The hadoop-env.sh is a script that sets a number of environment variables. Normally,
with Hadoop, these variables are not set but with BigInsights, they are. There is one that
must always be set and that is the `JAVA_HOME` environment variable.
Here are some of the settings found in core-site.xml. We are not going to spend time on these nor
those on this page as well. If you want to pause the video to read their description,
feel free to do so.

Next we have some setting in hdfs-site.xml. If you want to set a different value for the
default block size, then you would modify dfs.block.size. Likewise, if you want to change
the default replication factor, then you would modify dfs.replication. Once again, I am not
going to cover all the parameters.

To change MapReduce settings, you modify mapred-site.xml. You can control which nodes can connect to
the JobTracker. Mapreduce.job.reduces lets you set the number
of reduce tasks per job. mapreduce.map.speculative. execution allows the JobTracker, when having
determined that there might be a problem with one map task, to start another map task running
in parallel. Both map tasks process the same data and, upon successful completion of one
of the tasks, the other is terminated. mapreduce.tasktracker.map.tasks.maximum and mapreduce.tasktracker.reduce.tasks.maximum
lets you define the number of slots on a TaskTracker that can run map and reduce task.
mapreduce.jobtracker.taskScheduler points to the scheduler that is to be used for MapReduce
jobs.

So how do you set these parameters? First of all, you must stop the appropriate service
or services before making the change. You are making changes to value element for the
appropriate property element. The configuration files are in the hadoop-client/conf directory.
The changes must be made to the configuration files on all nodes in the cluster.
Let me spend a few minutes and focus on BigInsights. With BigInsights the hadoop-conf directory
is under `$BIGINSIGHTS_HOME`. But, and this is very important, you do not make changes
to the configuration files in that directory. BigInsights has a staging directory which
is `$BIGINSIGHTS_HOME/hdm/hadoop-conf-staging` that has copies of the configuration files.
You make changes to the files in this staging directory and then execute a script that distributes
the changes to all nodes in the cluster.

Finally, let us talk about setting up rack topology.
To make Hadoop aware of the clusters topology, you code a script that receives as arguments,
one or more ip addresses of nodes in the cluster. The script returns on stdout, a list of rack
names, one for each input value. Then you update core-site.xml and modify the topology.script.file.name
property to point to your script.