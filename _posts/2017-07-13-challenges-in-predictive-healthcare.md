---
layout: post
title: Challenges in creating predictive healthcare solutions
author: Mike Draugelis
date:   2017-06-13 12:00:00 -0500
comments: true
categories: healthcare
---

Intro
    - There are many things we would like to be able to use AI for to help medical decision making
        - There is an increasing amount of data available to work with
        - However, this data comes with several unique challenges
        - This post is the first in a series we're doing on the particular challenges of...

data science janitorial work
    - EHR data has all kinds of weirdnesses
        - Data from the future
        - Sampling issues
            - consequences for 'interpretable' models vs pure predictions
            - Informed presence bias
                - Observations are being made based on a knowledge model that we don't have access to

Data at rest != streaming
        - models built on warehouse 
        - re-engineering required to deploy to streaming

Instrumentation
    - many risk models are deployed without instrumentation
    - Importance of monitoring data inputs,
        model predictive performance, 
        but also linking the predictive performance to the outcome(s) of interest.
        (eg predicting deterioration, monitoring actions taken and outcomes realized).
    - Which brings us to the importance of the design of deployment
    to ensure that the relevant quantities are measurable. Does the intervention change the probability of the event that you're predicting?
    Is randomization required?

Clinical Decision Making
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