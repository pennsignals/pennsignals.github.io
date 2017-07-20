---
layout: post
title: Some challenges in creating predictive healthcare solutions
author: Corey Chivers <corey.chivers@uphs.upenn.edu>
date:   2017-07-18 12:00:00 -0500
comments: true
categories: healthcare, AI, data, data science, machine learning, pipelines
---

Here at Penn Medicine, we're developing uses of AI and machine learning to help improve medical decision making. As the electronic medical record (EMR) has matured, and its adoption becomes widespread, there has been an increasing amount of data available to work with toward this end. However, this data comes with several unique challenges -- many of which we have encountered firsthand, and others that we expect to face soon. Some aspects of these are specific to healthcare, while others apply to data science more broadly, but with a healthcare spin. This post is the first in a series we have planned on the particular challenges presented by medical and healthcare data in machine learning applications, and how we're tackling them head on.

### It's gonna be messy

While far from unique to healthcare, it is widely acknowledged that the so-called ['janitorial' work](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html) of data science can be the [most time consuming and least enjoyable](https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says) part. And while I'm sure I'm wading into a morass of 'my data is messier than yours' contentions, I contend that this issue is particularly acute with healthcare data.

Consider for instance the simple concept of a patient's temperature. The sheer variety of locations a nurse or doctor might (or might not) record the temperature within the EHR  astounding. Add to that the uncertainty induced by potentially inconsistent units (let's all grow up and agree to use the metric system, right?), the nature of the reading instrument and location (was it taken orally, or rectally?), or any number of potentially medically relevant factors. Having gotten past these, we might expect the value to be a `float`, and to be within some physiologically appropriate range. However, an example entry observed in the wild is:

```Unable to take temperature, the patient just ate ice.```

How ought we account for this entry, as well as subsequent entries likely to be affected by this business about the 'ice'? 

In addition to these issues, the observation time (e.g., the 'valid time' when a patient's temperature, or other vital signs) is not necessarily the same as, or even close to, the time the healthcare provider recorded the value in the EHR (e.g., the 'machine time'). We've even noticed data apparently arriving from the _future_! These timing issues are incredibly important considerations when constructing and validating machine learning models using EHR data.

### Data at rest != streaming

In addition to weirdnesses like data arriving from the future, the distinction between 'valid time' and 'machine time' has significant consequences when building and validating machine learning models. For instance, the enterprise data warehouse, that is designed to record only the final (and assumed _truest_) state of the patient record, may not capture any erroneously entered data that was subsequently corrected. The consequence of this is that any model built and evaluated on the cleaned final state data will not perform as expected in the wild. The distribution of data in the live data stream will differ from both the training and test data used in development.

A model of the data generating process in real-time looks something like this:

<img src="https://user-images.githubusercontent.com/1396669/28430269-dade1894-6d4d-11e7-93fb-8ea12be579b3.png" width="80%">

The consequences for real-world model performance compared with that evaluated on the EDW's fixed, historical data can be profound. We found that in the real-time setting, updates and deletes indeed happen quite often:

<img src="https://user-images.githubusercontent.com/1396669/28382049-cf8d5522-6c8a-11e7-8015-d4f50b0d8f8f.png" width="80%">

In addition to this, the precision of the 'valid time' is governed by the users, and can be subject to systematic biases. For instance, care givers tend to round their estimate of when they took the observation, often to the coarseness of the nearest hour.

<img src="https://user-images.githubusercontent.com/1396669/28382059-d5445b78-6c8a-11e7-941d-0f069280bd13.png" width="80%">

While vital signs and other direct patient observations come with the above considerations, another important source of health data is lab values. These are the blood workups, bacterial cultures, urinalysis, and the like. This data stream comes with a similar set of time-related issues. There are no less than three unique time-stamps associated with a lab observation: a) Ordered time, b) Drawn time, and c) Resulted time. In addition to which we could consider others, including d) Reviewed time (when the clinician actually sees the result). For lab cultures, results can arrive in parts over time as the organism develops, and trials of antibiotic susceptibility play out. All of these components of time have their meaning within the model building, evaluation, and production deployment processes. 

### Instrumentation
    
Many prediction/risk models that are in current use in the healthcare space are deployed as paper worksheets, or as simple applets into which the clinician enters some data and a score is returned. These implementations decouple the prediction from the outcome, and lack even the most basic instrumentation.

Given the various issues that can arise with healthcare data, the importance of monitoring data inputs, model outputs, and overall system performance is paramount.

### Clinical decision making

Ultimately, we're trying to improve patient outcomes by helping clinicians make better decisions with the plethora of data they increasingly have available to them. Healthcare is a human process, and hence, involving the relevant humans from the beginning is of the utmost importance. 

Important questions we have learned to ask up front in this collaborative process include:

1. What are the current workflows?
2. Who and how are decisions about risks being made at present?
3. Is there any opportunity to improve on this?
4. Is the problem a knowledge gap, or a process breakdown? 

### What we're doing at Penn

In a series of coming posts, we'll be describing several projects we're undertaking, and how we're attempting to address the issues and challenges that we have encountered in applying predictive data solutions in healthcare. We're building data science software solutions to address the unique challenges posed by healthcare data specifically. It is our hope that these tools will be adopted beyond Penn Medicine to empower predictive healthcare solutions and ultimately improve the lives of patients everywhere. 
