---
layout: post
title: CHIME comparison against Imperial College COVID-19 Publication
author: Mike Draugelisg <michael.draugelis@pennmedicine.upenn.edu> & Asaf Hanish <asaf.hanish@pennmedicine.upenn.edu>
date:   2020-03-18 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---
CHIME comparison against Imperial College COVID-19 Publication
-----

CHIME comparison against Imperial College COVID-19 Publication
-----
We've been running CHIME on a daily bases to create reports for our  health system leadership.  CHIME's simple design and interface enables quick support for tens of scenarios a day for hospital planners.  It also allows transparent and understandable parameters for our partners to assess.

The challenge is, in the absense or uncertainty of information, it's left to the team to make reasonable estimates and bounded scenarios.  But it's tough doing this work in a vacuum without comparisons and feedback!  

The recent paper from [Imperial College COVID-19 Response Team](https://www.imperial.ac.uk/media/imperial-college/medicine/sph/ide/gida-fellowships/Imperial-College-COVID19-NPI-modelling-16-03-2020.pdf) is giving us a window into another simulation that enables gives us a comparison of our model and assumptions!

In the paper, they compared the impacts of various public health measures called non-pharmaceutical interventions (NPIs).  
![Interventions"](https://i.ibb.co/5xq4Dy5/imp-table2.png)
They applied a previously published microsimulation model to two populations, the UK (Great Britain specifically) and the US.  When they ran various scenarios of "public distancing", they demonstrated that decisive action could mitigate impacts to health systems.  

![total cases and mortality](https://i.ibb.co/pZ500rr/img-col-deathrate.png)
 Figure 1 shows the US curve shifted and flattened due to an assumed slow spread based on geographic distance. The US peak is about 80% of GB's peak and shifted about two-weeks to late June.
 
![Critical Care Bed Demand](https://i.ibb.co/FKMZj4b/imp-col-cc-outcomes.png)

Figure 2 shows that in the case of "Do nothing," GB would need about 190,000 critical care beds.  We extrapolate from the paper that the US estimate is 730,000 needed critical care beds (275 critical care beds per 100,000 and scale that by 80%, to get 730,000 needed critical care beds).  There are currently [97,000 critical care beds in the US](https://www.sccm.org/Blog/March-2020/United-States-Resource-Availability-for-COVID-19).  It's clear why this paper has garnered so much [attention](https://www.washingtonpost.com/world/europe/a-chilling-scientific-paper-helped-upend-us-and-uk-coronavirus-strategies/2020/03/17/aaa84116-6851-11ea-b199-3a9799c54512_story.html).  

In addition to these researchers helping to turn the tide of US Government opinion, they also provided a road map to validate less complex models that local health systems and policymakers are using.  Their high fidelity model along with their clarity in expressing the inputs and interpretation of the scenario outcomes allows us to map into our simpler CHIME simulation.  

This blog post is not intending to thread-the-needle in translating their results to ours.  Instead we make reasonable assumptions and assess if our results reasonable compare and maintaine the same story for our health system leaders.   

The goal 
1. Compare CHIME and Imperial College paper's 'Do nothing' scenario
2. Compare CHIME's Social Distancing parameter with different scenarios from the paper.

We hope to provide transparency in our process, some guideance on parameter setting, and gain insight into our own model and results.

Comparison against Imperial College Paper's "Do Nothing" scenerio
------
Here are the Imperial College paper settings and mapping to CHIME paramters:

CHIME parameters to replicate US "Do Nothing" scenerio:
|parameter| value  | Imp Col Parameter |
|--|--|-- |
|Regional Population  | 331,002,651 | Same |
|Currently Hospitalized COVID-19 Patients | 2200 | N/A |
| Currently Known Regional Infections | 5000 (March 16)| ~ 100 patients in critical care (Trigger Population) |
|Doubling time before social distancing (days) | 7 (Ro=2.46) | Ro=2.4|
| Social distancing (% reduction in social contact) | 0 | 0 |
|Hospitalization %(total infections) | 5 | 5 |
| ICU %(total infections) | 0 | N/A  |
| Ventilated %(total infections) | 1.5 | 1.5 (30% of Hospitalized) |
| Market Share | 100%| N/A |
| Hospital Length of Stay | 8 days  | 8 |
| Vent Length of Stay | 16 days | 16 |
WE didn't include ICU-only patients because the paper did not.  The paper assumed all critical care patients are vented for 6 days and then remain in the ICU for 10 days.   

![CHIME Do Nothing\label{Figure A}](https://i.ibb.co/LnPJRW9/chime-vent15.png)  

CHIME results, \ref{Figure A}, show a peak critical care beds at 600,000 in mid-June. 
| Parameter | CHIME Scenario | Imp Col |   
|--|--|--|
| Peak Date | Mid June  | Mid-End June |
| Peak Ventilated or Critical Care Census | 600,000 | 730,000|
 
The comparisons are in the ballpark which gives us confidence continue the evaulation into social distancing interventions.

Exploration of Social Restrictions Parameters
-----
PA social distancing restrictions as of March 16.
|Date| Label  | Policy|
|--|--| --|
| Monday, March 16 | PC | All K-12 Pennsylvania schools will be closed for ten business days effective Monday, March 16.|
| Tuesday, March 17| SD | All nonessential businesses are ordered closed.  Supermarkets, pharmacies, and gas stations will remain open. Businesses that offer carry-out, delivery, and drive-through food and beverage service may continue|
| Monday, March 16| SD | Suggestions to restrict to 10 people or less| 
| CDC guidelines | HQ or CI| CDC instructions voluntarily self quarantined| 

These real world policies and guidelines have moved the US towards the paper's definition of CI, HQ, PC, and SD but it's challenging to estimate (guess) what the effect will havce and % reduction of social contact.

Luckily we found a [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6113687/) that gives a start on estimating!  In this paper they give some good basic parameters.
|Parameters| Values |
|--|--|
| Average Interactions a day | 12 |
|Adult Interaction Ratios | Family (40%), Friends (30), Other (30%) |
|Child Interaction Ratios | Family (45%), Friends (20), Other (35%) |

Now to make assumptions on the _Other_ category!
|Parameters| Ratio of _Other_ Interactions|
|--|--|
| Kids | 70% school , 12% nonessential , 18% essential  |
| Adults | 30% essential, 70% nonessential |

Finally, we going to assume that social distancing can reduce 50% contact with friend and Other interactions.

With some quick algebra we arrive a the following parameters:
| Intervention | % reduction of social contact  |
|--|--|
| Schools Closings (PC)  | 4% |
| Close non-essential business (SD) | 8% |
| Social Distance (SD) | 31% | 

CHIME's simluated results based on these assumptions
|% reduction of social contact| Scenario | Peak Reduction|
|--|--|--|
| 4% | Schools closings | 15% |
| 12% | Schools closings + closing nonessential businesses | 31%  |
| 31% | Schools closings + nonessential business + Social Distancing | 65%  |

Comparison with Imperial College Social Restrictions Analysis
----
Table 3 from the Imperial College paper shows similiar impact with a variety of interventions.
 
![enter image description here](https://i.ibb.co/MgVFQjk/imp-col-mitigation.png)

We selected the following row 
![enter image description here](https://i.ibb.co/jbLrS1w/comparison-social.png)

since, as of March 16, there were about 5,000 known US cases and, therefore, about 75 cumulative ICU cases (Trigger value).


-- Penn Predictive Healthcare Team

