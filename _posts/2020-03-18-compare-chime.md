---
layout: post
title: CIME comparison against Imperial College COVID-19 Publication
author: Mike Draugelisg <michael.draugelis@pennmedicine.upenn.edu> & Asaf Hanish <asaf.hanish@pennmedicine.upenn.edu>
date:   2020-03-18 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

CHIME comparison against Imperial College COVID-19 Publication
-----

The [Imperial College COVID-19 Response Team recently published a compelling paper](https://www.imperial.ac.uk/media/imperial-college/medicine/sph/ide/gida-fellowships/Imperial-College-COVID19-NPI-modelling-16-03-2020.pdf) showing that strong public health policies are needed to protect our health system. 

In the paper they compared the impacts of various public health measures called non-pharmaceutical interventions (NPIs).  
![Interventions"](https://i.ibb.co/5xq4Dy5/imp-table2.png)
They applied a previously published microsimulation model to two populations, the UK (Great Britain specifically) and the US.  When they ran various scenioros of public distancing they demonstarted that decisive action could avoid outcomes seen in Milan, Madrid, Brussels, and Seattle.  

![total cases and mortality](https://i.ibb.co/pZ500rr/img-col-deathrate.png)
 The Figure 1 shows the US curve shifted and flattend due to an assumed slow spread based on larger geographic distance. The US peak is about 80% of GB's peak and shifted about two-weeks to late June.
 
![Critical Care Bed Demand](https://i.ibb.co/FKMZj4b/imp-col-cc-outcomes.png)

Figure 2 shows that, in the case of "Do nothing", GB would need about 190,000 critical care beds.  As a rough US estimate we could take the peak value of 275 critical care beds per 100,000 and scale that by 80%, to get 730,000 needed critical care beds.  There are currently [97,000 critical care beds in the US](https://www.sccm.org/Blog/March-2020/United-States-Resource-Availability-for-COVID-19).  It's clear why this paper has gannered so much [attention](https://www.washingtonpost.com/world/europe/a-chilling-scientific-paper-helped-upend-us-and-uk-coronavirus-strategies/2020/03/17/aaa84116-6851-11ea-b199-3a9799c54512_story.html).  

In addition to these researchers helping to turn the tide of US Goverment opionon they also provide a road map to validate less complex models that local health systems and policy makers are using.  Specifically, their use of a validated high fidelity model along with their clarity in expressing the inputs and interpreation of the scenario outcomes allows us to map into our lower fidelity CHIME simulation.  Of course this blog post is not threading the needle in translating their simulation to ours, but instead we'll try to make reasonable assumptions to map into our current state and model parameters.   The goal 
1. Validate the CHIME tool against the 'do nothing' scenario
2. Provide guidance on our new CHIME parameter Social Distancing. 

My hope is to provide transparency for feedback and discussion to enable better use of local simulations.

Validation against Imperial College Analysis
------
Here are the Imperial College paper settings and mapping to CHIME paramters:


CHIME parameters to replicate US "Do Nothing" scenerio:
|parameter| value  | Imp Col Parameter |
|--|--|-- |
|Regional Population  | 331,002,651 | Same |
|Currently Hospitalized COVID-19 Patients | 2200 | N/A |
| Currently Known Regional Infections | 5000| Trigger Population |
|Doubling time before social distancing (days) | 7 (Ro=2.46) | Ro=2.4|
| Social distancing (% reduction in social contact) | 0 | 0 |
|Hospitalization %(total infections) | 5 | 5 |
| ICU %(total infections) | 0 | N/A |
| Ventilated %(total infections) | 1, 2 | 1.5 (30% of Hospitalized) |
| Market Share | 100%| N/A |
| Hospital Length of Stay | 7  | N/A |
| Vent Length of Stay | 16 days | 16 |
We'll run CHIME in two scenarios (1) Ventilated % = 1, (2) Ventilated % = 2
|Scenario 1| Scenario 2  |
|--|--|
|![CHIME Do Nothing\label{Figure A}](https://i.ibb.co/0t7RdBz/chime-vent-1perc.png)  | ![enter image description here](https://i.ibb.co/xSCgryp/chime-vent-2perc.png) |

CHIME results, \ref{Figure A}, show a peak critical care beds at 800,000 in mid-June. 
| Parameter | CHIME Scenerio 1 | CHIME Scenerio 1 |Imp Col |   
|--|--|--|--|
| Peak Date | Mid June  |Mid June  |Mid-End June |
| Peak Critical Care Census | 400,000 | 800,000 |730,000|

For scenario 2, the 9% lower number from the Imp Col paper may be due to a better simulation of age distribution, in our model we assume equal likelihood for hospitilization among age groups.
 
The comparison alignement gives us more confidence in scenario 2 setting.  We'll now compare with the Imperial College work to guide how we interpret select our Social Restriction values.

Exploration of Social Restistrition Paramaters
-----
The impacts of the mitigation plan, table 3, are going to be the guides for first seleting the Social Restriction.
![enter image description here](https://i.ibb.co/MgVFQjk/imp-col-mitigation.png)
In the Philadelphia region freedom of travel remains, but all Pennsylvanians are asked to refrain from non-essential travel.  In addition all schools and universities (PC) and nonessential business have been temporarly closed.  These policies and guidelines moved towards the papers definition of Social Distancing of the entire population (SD) but they don't enforce them.  So our similulation parameters (Ro) should not be as low as their derived value.  Just today on my run on the along the river I saw many families at the park playing on the jungle gyms.
|Date| Label  | Policy|
|--|--| --|
| Monday, March 16 | PC | All K-12 Pennsylvania schools will be closed for 10 business days effective Monday, March 16.|
| Tuesday, March 17| SD | All nonessential business are ordered closed.  Supermarkets, pharmacies, and gas stations will remain open. Businesses that offer carry-out, delivery, and drive-through food and beverage service may continue|
| Monday, March 16| SD | Suggestions to restrict to 10 people or less| 
| Friday, March 13| SD | UPHS and  other business moved many employees employee to work at | 

-- Penn Predictive Healthcare Team

