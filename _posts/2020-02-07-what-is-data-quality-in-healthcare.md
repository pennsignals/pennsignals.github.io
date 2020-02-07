---
layout: post
title: What does 'data quality' mean in Healthcare?
author: Corey Chivers, PhD <corey.chivers@pennmedicine.upenn.edu>
date:   2020-02-07 12:00:00 -0500
comments: true
tags: [healthcare, AI, data, data science, machine learning]
---

Everyone wants quality data. In healthcare, clinicians need to make complex decisions based on a vast array of data from multiple sources.  Thankfully for patients, clinicians are perennially skeptical when it comes to the quality of every data point put in front of them. As data scientists, when building tools to help data-driven clinical (or indeed, operational) decision making, we invariably hear the refrain:  

<p align="center"><b>"Can I trust this data?"</b></p>



### 1) It is erroneous
- wrong value, wrong patient, human entry error

### 2) It doesn't mean what you think it means
- wrong definition of clinical concept
- This can change over time

### 3) It was valid once, but is not any more
- eg Problem lists where 'active' status not always updated

### 4) It represents a user workaround, rather than expected utilization.

In healthcare data, and EHR data in particular, the vast majority of the 'data' is created by a human user who is trying to get something done.