---
author: "Andrew Goss"
date: 2016-09-17
title: Google Analytics Reporting API for PostgreSQL
tags:
  - python
  - programming
---
![Python](/img/post/python.png "Python")<br>
<a href="/projects/">Projects</a> >> <b>Google Analytics Reporting API for PostgreSQL</b>
<hr>

This is a Python script I developed for programmatically accessing report data in Google Analytics and inserting into PostgreSQL. 

Google Analytics Reporting API V4 is used in this code. A detailed reference of the API can be accessed <a href="https://developers.google.com/analytics/devguides/reporting/core/v4" target=_>here</a>.

In this example, a GA summary report is generated (using the JSON below) and inserted into a PostgreSQL staging table with the same name. These dimensions/metrics can be modified using the <a href="https://developers.google.com/analytics/devguides/reporting/core/dimsmets" target=_>Dimensions & Metrics Explorer</a> as a guide.<br><br>

```json
{
	"Dimensions": [
		{
			"name": "ga:date"
		},
		{
			"name": "ga:country"
		}
	],
	"Metrics": [
		{
			"expression": "ga:sessions"
		},
		{
			"expression": "ga:percentNewSessions"
		},
		{
			"expression": "ga:newUsers"
		},
		{
			"expression": "ga:bounceRate"
		},
		{
			"expression": "ga:transactions"
		},
		{
			"expression": "ga:transactionRevenue"
		},
		{
			"expression": "ga:transactionsPerSession"
		}
	],
	"dimensionFilterClauses": [
		{
			"filters": ["none"]
		}
	],
	"Segment": []
}
```
<br class="custom"><a href="https://github.com/andrewrgoss/ga-reporting-api" class="btn" target="_blank">View my code on GitHub</a><br class="custom">