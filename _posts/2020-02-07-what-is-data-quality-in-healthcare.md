---
layout: post
title: What does 'data quality' mean in Healthcare?
author: Corey Chivers, PhD <corey.chivers@pennmedicine.upenn.edu>
date:   2020-02-07 12:00:00 -0500
comments: true
tags: [healthcare, AI, data, data science, machine learning]
---

Everyone wants quality data. Healthcare is no different. However, over time our team has come to notice that there are some ways in which data may be considered _no bueno_ that feel particular (at least in part) to the healthcare setting.

In healthcare, clinicians need to make complex decisions based on a vast array of data from multiple sources. Thankfully for patients, clinicians are perennially skeptical when it comes to the quality of every data point put in front of them. As data scientists, when building tools to help data-driven clinical and operational decision making, we invariably hear the refrain:  

<p align="center"><b>"Is this data any good?"</b></p>

Trust in data - and in machine learning models upon which they are built - can be lost in many ways. Here's a list of 4 of the most common ones we've seen in working with healthcare data, and EHR (electronic health records) data in particular.


## Data can be bad in a variety of ways

### 1) It is erroneous

Someone or something just plain goofed. Either a device or sensor is generating bogus values, or a human has entered data mistakenly. To err is human, and to break down is machine. Either way, the result can be bad data.

*Example: Blood pressure is entered as a pair of values, Systolic and Diastolic. It's all too easy to invert them.*
![image](https://user-images.githubusercontent.com/1396669/74168329-8e063c00-4bf7-11ea-96a9-d674ede1b557.png)

*Example: The O2 delivery method being entered by two providers who disagree. A common occurrence when disciplines have distinct flowsheets in the chart. We call this phenomenon 'dueling flowsheets'*
![image](https://user-images.githubusercontent.com/1396669/74166363-6feb0c80-4bf4-11ea-8f8c-f461a49a8619.png)


### 2) It doesn't mean what you think it means

Clinical concepts change over time, and with them their representation in data. 

*Example: The National Pressure Ulcer Advisory Panel (NPUAP) issued guidance on staging of skin conditions. Conditions being recorded as 'Pressure ulcer' abruptly changed to being recorded as 'Pressure injury'.*
![image](https://user-images.githubusercontent.com/1396669/74167638-8b571700-4bf6-11ea-9800-3f6cde955407.png)

### 3) It was valid once, but is not any more

Data can become 'stale' for a variety of reasons. Both technical and human components can delay the input and processing of critical data. 

*Example: Latency in a real-time data pipeline processing HL7 messages can have a long tail, resulting in data which may be obsolete by the time it reaches the downstream system.* 
![image](https://user-images.githubusercontent.com/1396669/74168731-27355280-4bf8-11ea-8ceb-3aa982148139.png)

Additionally, clinical states which are best described as *spans*, with start times and stop times, are often recorded as point in time events. This can lead to 'hanging' states, where it is unclear if the previous point in time record continues to accurately represent the patient state.

*Example: Mechanical ventilation captured by point in time flowsheets. How long is each patient state valid?*
![image](https://user-images.githubusercontent.com/1396669/74366842-c300c300-4d9e-11ea-8ae3-56c770199ce6.png)

### 4) It represents a user workaround, rather than expected utilization.

In healthcare data, and EHR data in particular, the vast majority of the 'data' is created by a human user who is trying to get something done. Humans are smart and will come up with ingenious ways to get things done that work for them, even when the tool they have available wants them to do it another way.

<p align="center">The user will find a way.</p>
![image](https://user-images.githubusercontent.com/1396669/74063518-932c7680-49be-11ea-872b-22b07022a398.png)

*Example: Patient checkouts being done in batches before lunch and at end of day. Total 'in clinic' time artificially inflated by this.*
![image](https://user-images.githubusercontent.com/1396669/74171311-5fd72b00-4bfc-11ea-9ff8-d8b42db18862.png)
