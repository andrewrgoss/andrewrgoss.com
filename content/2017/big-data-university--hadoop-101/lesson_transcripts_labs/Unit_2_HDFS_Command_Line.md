---
author: "Andrew Goss"
date: 2016-10-18
title: Big Data University- Hadoop 101
---
![Hadoop](/img/post/hadoop.png "Hadoop")<br>
<a href="/2017/big-data-university--hadoop-101/">Big Data University- Hadoop 101</a> >> <a href="/2017/big-data-university--hadoop-101/lesson_transcripts_labs">Lesson Transcripts/Labs</a> >> <b>Unit_2_HDFS_Command_Line</b>
<hr>

<iframe width="660" height="371" src="https://www.youtube.com/embed/Gd1sVPOYzuk" frameborder="0" allowfullscreen></iframe>

Welcome to HDFS command line interface.
In this presentation, I will cover the general usage of the HDFS command line
interface and commands specific to HDFS. Other commands should be familiar to
anyone with UNIX experience and will not be covered.

The HDFS can be manipulated through a Java API or through a command line
interface. All commands for manipulating HDFS through Hadoop's command line
interface begin with `hdfs`, a space, and `dfs`. This is the file system shell. This
is followed by the command name as an argument
to `hdfs dfs`. These commands start with a dash. For example, the `ls` command
for listing a directory is a common UNIX command and is preceded with a dash.
As on UNIX systems, `ls` can take a path as an argument. In this example, the
path is the current directory, represented by a single dot.

As we saw for the `ls` command, the file system shell commands can take paths as arguments.
These paths can be expressed in the form of <b>uniform resource identifiers</b> or URIs. The
URI format consists of a scheme, an authority, and path. There are multiple schemes supported.
The local file system has a scheme of "file". HDFS has
a scheme called "hdfs". For example, let us say you wish to copy a file called "myfile.txt"
from your local filesystem to an HDFS file system on the localhost. You can do this by
issuing the command shown. The cp command takes a URI for the source and a URI for the
destination. The scheme and the authority do not always need to be specified. Instead
you may rely on their default values. These defaults can be overridden by specifying them
in a file named core-site.xml in the conf directory of your Hadoop installation.
HDFS is not a fully POSIX compliant file system,
but it supports many of the commands. The HDFS commands are mostly easily-recognized
UNIX commands like `cat` and `chmod`. There are also a few commands that are specific to HDFS
such as `copyFromLocal`. We'll examine a few of these.

`copyFromLocal` and `put` are two HDFS-specific commands that do the same thing -
copy files from the local filesystem to a location on another filesystem. Their opposite
is the `copyToLocal` command which can also be referred to as get. This command copies
files out of the filesystem you specify and into the local filesystem.
`getMerge` is an enhanced form of get that can merge the files from multiple locations
into a single local file. `setRep` lets you override the default level
of replication. You can do this for one file or, with the `-R` option, to an entire tree.

This command returns immediately after requesting the new replication level. If you want the
command to block until the job is done, pass the `-w` option.
IBM, with BigInsights, provides the Ambari Console as graphical way to work with HDFS.
The services tab provides a simple way to view the status of the Hadoop components.
Create a file view to browse and work with directories and files.