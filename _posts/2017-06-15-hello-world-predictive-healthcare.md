---
layout: post
title: Penn Medicine Predictive Healthcare
author: Mike Draugelis
date:   2017-06-15 10:59:56 -0500
comments: true
categories: healthcare
---


Penn Medicine Predictive Healthcare
=================
In 2014, we started our work at Penn Medicine with one simple goal: to make our patients' lives better, and to create a more efficient health system.

Three years later, Penn is now benefitting from predictive health care, with measurable results and lives saved.  State-of-the-art applications have been deployed (some running in real-time), and clinical workflows have been updated to the benefit of all involved.

Penn's success has depended, in large part, on a deep commitment to collaboration, transparency, and openness.

But there is still much work to be done.  Integrating predictive applications into clinical workflows is complex and challenging, as is the constant adaptation required in an ever-changing technology landscape.  Add to this mix the general misunderstanding of exactly what data science is and how it can help, coupled with the immense complexities of clinical data.....it's hard.

My hope is by sharing our experiences we can enable other health systems to be successful using predictive systems, and help grow the community of predictive healthcare practitioners and data scientists.

## How we think about Data Science in healthcare
Healthcare, like other business areas, uses data analysts to provide insight into the effectiveness of business processes. This analysis provides strategic decision support to business leaders.  A natural tendency would be to apply the powerful tools of Data science to provide even more insightful reports to make decisions on.  Finding the proverbial needle in the haystack.

However, we believe that the biggest impacts of data science in healthcare are going to come from predictive applications inserted into the workflow of care providers and patients.  Our focus on real-time decision making has required us to get serious, super serious, about clinical data, model reproducibility, transparency, and experimentation.

### Data Integrity
: Timestamps, latency, time zones (data from the future!...it happens)
Pipeline availability (where's my freakin' data?...sometime hours late)
Patient identifier inconsistency (80-year-old newborns?!...just weird stuff)
Multiple fields referring to the same types of data (heart rate, pulse, etc.)

### Algorithms
: Making them good enough and interpretable enough to use in a clinical setting. [^footnote1],[^footnote4]

### Model Reproducibility
: Knowledge management.  When did the system 'know' something and can we branch on that knowledge.  Think _software version control meets data streams_.

### Operations
:  Developing, deploying, experimenting with and measuring predictive healthcare programs.

## What we're working on
We have a set of clinical projects that keeps use busy but we're always building on and from our predictive pipeline we call [Penn Signals](https://www.pennmedicine.org/news/news-releases/2016/may/penn-medicine-information-serv).

Penn Signals
: A real-time pipeline of micro-services, to generate multiple predictive applications delivered to clinical and operational teams. Penn Signals removes barriers for data scientists and application developers to create, deploy and maintain predictive applications in support of Penn Medicine’s shift to value based care, preventive healthcare, and precision medicine.  We will begin open sourcing our micro-services, docker containers and applications in 2017-2018.

Severe Sepsis Prediction
: [The first developed and validated the machine learning algorithm to predict severe sepsis and septic shock in a large academic multi-hospital healthcare system](https://www.healthdatamanagement.com/news/penn-leverages-machine-learning-to-identify-severe-sepsis-early)[^footnote3]

High Risk Heart Failure Patient
: [Predicting heart failure patients at risk of hospitalization](https://www.pennmedicine.org/news/news-blog/2017/february/the-little-algorithm-that-could)

Maternal Decline Risk
: Identify women after delivery that are at risk of hemorrhage, infection and hypertension.

Lung Connect (Lung Cancer)
: [Predicting cancer patients at risk of hospitalization](https://www.pennmedicine.org/news/news-blog/2017/january/can-big-data-help-cancer-patients-avoid-er-visits)

Vent Management
: Identify patients on a ventilator that may be ready for early extubation.  [^footnote2]

[^footnote1]:  Li-Fang Cheng, Gregory Darnell, Corey Chivers, Michael E Draugelis, Kai Li, and Barbara Engelhardt, Sparse multi-output gaussian processes for medical time series prediction, arXiv preprint arXiv:1703.09112 (2017).

[^footnote2]: Barry Fuchs, Corey Chivers, Venkat Panchanadam, Michael Draugelis, David Do, Anne Marie Huefnberger, Mark Stepanik, Steven Gudowski, Asaf Hanish, Maurizio Cereda, et al.,Accuracy and opportunity of an automated ventilator and sedation weaning alert progam, A25. CRITICAL CARE: HOW TO GET IT DONE IN THE ICU-TOOLS AND TRICKS OF IMPLEMENTATION IN CRITICAL CARE, American Thoracic Society, 2017, pp. A1146.

[^footnote3]: Heather M Giannini, Corey Chivers, Michael Draugelis, Asaf Hanish, Barry Fuchs, Patrick Donnelly, Michael Lynch, Laurie Meadows, Samantha J Parker, William D Schweickert, et al., Development and implementation of a machine-learning algorithm for early identification of sepsis in a multi-hospital academic healthcare system , D15. CRITICAL CARE: DO WE HAVE A CRYSTAL BALL? PREDICTING CLINICAL DETERIORATION AND OUTCOME IN CRITICALLY ILL PATIENTS, American Thoracic Society, 2017, pp. A7015

[^footnote4]: Niranjani Prasad, Li-Fang Cheng, Corey Chivers, Michael Draugelis, and Barbara E Engelhardt, A reinforcement learning approach to weaning of mechanical ventilation in intensive care units , arXiv preprint arXiv:1704.06300 (2017)
