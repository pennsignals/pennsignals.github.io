---
layout: post
title: Challenges in creating predictive healthcare solutions
author: Mike Draugelis
date:   2017-06-13 12:00:00 -0500
comments: true
categories: healthcare
---

Here at Penn Medicine, we're developing uses of AI and machine learning to help improve medical decision making. As the electronic medical record (EMR) has matured, and it's adoption become widespread, there has been an increasing amount of data available to work with toward this end. However, this data comes with several unique challenges -- many of which we have encountered first hand, and others that we expect to face in the near future. Some aspects of these are unique to healthcare, while others are applicable to data science more broadly, but with a healthcare spin. This post is the first in a series we're doing on the particular challenges presented by medical and healthcare data in machine learning applications, and how we're tackling these challenges head on.  

## Data Science janitorial work

While far from unique to healthcare, it is widely acknowledged that the so-called ['janitorial' work](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html) of data science can be the [most time consuming and least enjoyable](https://www.forbes.com/sites/gilpress/2016/03/23/data-preparation-most-time-consuming-least-enjoyable-data-science-task-survey-says) part.


    - EHR data has all kinds of weirdnesses
        - Data from the future
        - Sampling issues
            - consequences for 'interpretable' models vs pure predictions
            - Informed presence bias
                - Observations are being made based on a knowledge model that we don't have access to

## Data at rest != streaming
        - models built on warehouse 
        - re-engineering required to deploy to streaming

## Instrumentation
    - many risk models are deployed without instrumentation
    - Importance of monitoring data inputs,
        model predictive performance, 
        but also linking the predictive performance to the outcome(s) of interest.
        (eg predicting deterioration, monitoring actions taken and outcomes realized).
    - Which brings us to the importance of the design of deployment
    to ensure that the relevant quantities are measurable. Does the intervention change the probability of the event that you're predicting?
    Is randomization required?

## Clinical Decision Making
    - Ultimately, we're trying to improve patient outcomes by helping clinicians make better decisions with the plethora of data they increasingly have available to them.
    - That means that this is fundamentally a human process, and hence, involving the relevent humans from the get-go is of the utmost import.
    - What are the current workflows?
    - How are decisions about risks being made at present?
        - is there any opportunity to improve on this?
        - Is the problem a knowledge gap, or a process breakdown? 

What we're doing at Penn
    - A series of comming posts
        - Aptos
        - PennSignals
        - Model explainers
        - Decision theory baked into design

Links:

decision theory paper
Our cutting edge research, which will need ds infrastructure (instrumentation), clinical engagement and input, and  - ()
t-pot - automating ML
DAC - http://www.med.upenn.edu/dac/ props for providing data warehouse
https://medium.com/towards-data-science/how-to-build-a-data-science-pipeline-f24341848045