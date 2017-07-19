---
layout: post
title: Challenges in creating predictive healthcare solutions
author: Corey Chivers
date:   2017-07-18 12:00:00 -0500
comments: true
categories: healthcare, AI, data
---

Here at Penn Medicine, we're developing uses of AI and machine learning to help improve medical decision making. As the electronic medical record (EMR) has matured, and it's adoption become widespread, there has been an increasing amount of data available to work with toward this end. However, this data comes with several unique challenges -- many of which we have encountered first hand, and others that we expect to face soon. Some aspects of these are specific to healthcare, while others apply to data science more broadly, but with a healthcare spin. This post is the first in a series we're doing on the particular challenges presented by medical and healthcare data in machine learning applications, and how we're tackling these challenges head on. 

## It's gonna be messy

While far from unique to healthcare, it is widely acknowledged that the so-called ['janitorial' work](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html) of data science can be the [most time consuming and least enjoyable](https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says) part. And while I'm sure I'm wading into a morass of 'my data is messier than yours' contentions, I contend that this issue is particularly acute with healthcare data. 

Consider for instance the simple concept of a patient's temperature. The sheer variety of locations within the EHR that this might (or might not) be recorded is astounding. Add to that the uncertainty induced by potentially inconsistent units (let's all grow up and agree to use the metric system, right?), the nature of the reading instrument and location (was it taken orally, or rectally?), or any number of potentially medically relevant factors. Having gotten past these, we might expect the value to be a float, and to be within some physiologically relevent range. However, an example entry observed in the wild is:

```Unable to take temperature, the patient just ate ice.```

In addition to these issues, the observation time (e.g., the 'valid time' when a patient's temperature, or other vital signs) is not necessarily the same as, or even close to, the time the healthcare provider recorded the value in the EHR (e.g., the 'machine time'). We've even noticed data apparently arriving from the _future_! These timing issues are incredibly important considerations when constructing and validating machine learning models using EHR data.

## Data at rest != streaming

In addition to weirdnesses like data arriving from the future, the distinction between 'valid time' and 'machine time' has important consequences when building and validating machine learning models. For instance, any erroneously entered data that was subsequently corrected may not be captured in an enterprise data warehouse intended to capture only the final state of the patient record. The consequence of this is that any model built and evaluated on the cleaned final state data will not perform as expected in the wild. The distribution of data in the live data stream will differ from both the training and test data used in development.

![streaming_not_at_rest]({{ site.url }}/assets/images/posts/StreamingPredsUpdates2.png)

## Instrumentation
    
Many risk models that are in current use in the healthcare space are deployed as paper worksheets, or as simple applets into which the clinician enters some data and a score is returned. These implementations decouple the prediction from the outcome, and generally lack even the most rudimentary instrumentation.
Given the various issues that can arise with healthcare data, the importance of monitoring data inputs, model outputs, and overall system performance is paramount.

## Clinical decision making

Ultimately, we're trying to improve patient outcomes by helping clinicians make better decisions with the plethora of data they increasingly have available to them. That means that this is fundamentally a human process, and hence, involving the relevant humans from the get-go is of the utmost import. Important questions we have learned to ask up front in this collaborative process include:

- What are the current workflows?
- How are decisions about risks being made at present?
    - Is there any opportunity to improve on this?
    - Is the problem a knowledge gap, or a process breakdown? 

## What we're doing at Penn

In a series of coming posts, we'll be describing several projects we're undertaking, and how we're attempting to address the issues and challenges that we have encountered in applying predictive data solutions in healthcare. 


- Aptos
- PennSignals
- Model explainers
- Decision theory baked into design









-----------------------------------------
Notes
        - Sampling issues
            - consequences for 'interpretable' models vs pure predictions
            - Informed presence bias
                - Observations are being made based on a knowledge model that we don't have access to


        - re-engineering required to deploy to streaming

        (eg predicting deterioration, monitoring actions taken and outcomes realized).
    - Which brings us to the importance of the design of deployment
    to ensure that the relevant quantities are measurable. Does the intervention change the probability of the event that you're predicting?
    Is randomization required?

Links:

decision theory paper
Our cutting edge research, which will need ds infrastructure (instrumentation), clinical engagement and input, and  - ()
t-pot - automating ML
DAC - http://www.med.upenn.edu/dac/ props for providing data warehouse
https://medium.com/towards-data-science/how-to-build-a-data-science-pipeline-f24341848045
