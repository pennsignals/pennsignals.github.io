---
layout: post
title: CHIME comparison against Imperial College COVID-19 Publication
author: Mike Draugelis <michael.draugelis@pennmedicine.upenn.edu> & Asaf Hanish <asaf.hanish@pennmedicine.upenn.edu>
date:   2020-03-18 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

A few days ago we launched [CHIME](/2020/03/14/accouncing-chime.html), a tool for COVID-19 hospital capacity planning. Since then, we've been running [CHIME](/chime) on a daily bases to create reports for our  health system leadership. CHIME's simple design and interface enables quick support for hospital planners to assess potential demand for resources over time.  It also allows transparent and understandable parameters for our partners to interrogate and modify as more information becomes available.

The recent paper from [Imperial College COVID-19 Response Team](https://www.imperial.ac.uk/media/imperial-college/medicine/sph/ide/gida-fellowships/Imperial-College-COVID19-NPI-modelling-16-03-2020.pdf) gives us a window into a disease model that has been used by world leadership to forecast capacity demands on healthcare systems.  

The CHIME model we've created also forecasts capacity demands on healthcare systems, so it's a valid (and interesting) test to compare the two models.  If both models predict similar outcomes, it potentially increases trust in both models.

Furthermore, we've recently introduced a new variable into the CHIME model, a "Social Distancing" parameter, in order for planners to better estimate the impacts of social distancing strategies.  

This blog post is not intending to thread-the-needle, translating the work of the Imperial Collage COVID-19 Response Team to ours.  Instead, we make reasonable assumptions and compare our results.   

Goals:
1. Compare CHIME and Imperial College team's 'Do nothing' scenario
2. Validate CHIME's Social Distancing parameter via comparison with different scenarios from Imperial College's.


Imperial College's Scenarios & Outputs As Documented by their COVID-19 Response Team
------

In the paper, the Imperial College team compared the impacts of various public health measures called non-pharmaceutical interventions (NPIs).  
![Interventions"](https://i.ibb.co/5xq4Dy5/imp-table2.png)
They applied a previously published microsimulation model to two populations, the UK (Great Britain specifically) and the US.  When they ran various scenarios of "public distancing", they demonstrated that decisive action could mitigate impacts to health systems.  

![total cases and mortality](https://i.ibb.co/pZ500rr/img-col-deathrate.png)
 Figure 1 shows the US curve shifted and flattened due to an assumed slow spread based on geographic distance. The US peak is about 80% of GB's peak and shifted about two-weeks to late June.

**Imperial College Team's Critical Care Capacity Curve**
 
![Critical Care Bed Demand](https://i.ibb.co/FKMZj4b/imp-col-cc-outcomes.png)

Figure 2 shows that in the case of "Do nothing," GB would need about 190,000 critical care beds.  

From there, one can extrapolate that the US may need as many as  730,000 critical care beds.  (The math is easy: 275 critical care beds per 100,000 people, and then scale that by 80%...which results in a total of 730,000 critical care beds.)

  There are currently  [97,000 critical care beds in the US](https://www.sccm.org/Blog/March-2020/United-States-Resource-Availability-for-COVID-19), which is a far cry from the predicted 730,000 needed.   

It's clear why this paper has garnered so much [attention](https://www.washingtonpost.com/world/europe/a-chilling-scientific-paper-helped-upend-us-and-uk-coronavirus-strategies/2020/03/17/aaa84116-6851-11ea-b199-3a9799c54512_story.html).  


CHIME Comparison against Imperial College Team's "Do Nothing" scenerio
------
To start, let's map the CHIME input parameters to the Imperial Collage Team's scenario assumptions to make for easier comparison.

NOTE:  The Imperial College's Team assumes every critical care patient is ventilated for 6 days, then remains in critical care for another 10 days.  This is different from how the CHIME model works.  The CHIME model seperates out vented patients from ICU patients (the ICU is our version of 'critical care').  For the purposes of this comparison, we'll match the Imperial College Team's assumptions and zero-out our ICU patients.  (Normally, this field would not be zero.)


|CHIME input parameters| value  | Imp Col Scenario Assumption |
|--|--|-- |
|Regional Population  | 331M | Same |
|Currently Hospitalized COVID-19 Patients | 2200 | N/A |
| Currently Known Regional Infections | 5000 (75 critical care patients)| 100 critical care patients (Trigger Population) |
|Doubling time before social distancing (days) | 7 days (Ro=2.46) | Ro=2.4|
| Social distancing (% reduction in social contact) | 0 | 0 |
|Hospitalization %(total infections) | 5 | 5 |
| ICU %(total infections) | 0 | N/A  |
| Ventilated %(total infections) | 1.5 | 1.5 (30% of Hospitalized) |
| Market Share | 100%| N/A |
| Hospital Length of Stay | 8 days  | 8 |
| Vent Length of Stay | 16 days | 16 |

**CHIME's Critical Care Capacity Curve (Based on Above Data)** 

![CHIME Do Nothing\label{Figure A}](https://i.ibb.co/LnPJRW9/chime-vent15.png)  

The CHIME results show a peak need of 600,000 critical care beds in mid-June. 

Note that these results are very similar to the results predicted by the Imperial College COVID-19 Response Team: 

| Parameter | CHIME Scenario | Imp Col |   
|--|--|--|
| Peak Date | Mid June  | Mid-End June |
| Peak Ventilated or Critical Care Census | 600,000 | 730,000|
 
The similarity of the results gives us confidence to continue this comparison. 

Exploration of CHIME's Social Distancing Parameter
-----
PA's social distancing strategies as of March 16, can be  mapped to Imperial College's set of non-pharmaceutical interventions (NPIs).

|Date| Label  | Policy|
|--|--| --|
| Monday, March 16 | PC | All K-12 Pennsylvania schools will be closed for ten business days effective Monday, March 16.|
| Tuesday, March 17| SD | All nonessential businesses are ordered closed.  Supermarkets, pharmacies, and gas stations will remain open. Businesses that offer carry-out, delivery, and drive-through food and beverage service may continue|
| Monday, March 16| SD | Suggestions to restrict to 10 people or less| 
| CDC guidelines | HQ or CI| CDC instructions voluntarily self quarantined| 

The strategies that PA has implemented (as described above) do not  necessarily meet the strict definitions of CI, HQ, PC and SD as defined by the Imperial College Team.  However, this mapping  does offer a framework by which to compare the two models.

The challenge with CHIME's new social distencing parameter is that it's not a bottom-up simulation parameter (like the Imperial College's simulation).  Instead, it's a top-down expectation of reduction, based on policies enacted.  The tricky part, then, is estimating (guessing) what any effect will have and the actual % reduction in social contact.

Happily, there's a [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6113687/).  

This paper allows us to calculate the impact of various social distencing strategies into actual % reduction numbers. 

To quickly summarize the paper:

|Parameters| Values |
|--|--|
| Average Interactions a day | 12 |
|Adult Interaction Ratios | Family (40%), Friends (30), Other (30%) |
|Child Interaction Ratios | Family (45%), Friends (20), Other (35%) |

In order to evaluate the closing of schools or other 'non-essential' businesses, we need to break down the "Other" category in the chart above.  

In other words, we need to *guess*.  Here is our best guess:

|Parameters| Ratio of _Other_ Interactions|
|--|--|
| Kids | 70% school , 12% nonessential , 18% essential  |
| Adults | 30% essential, 70% nonessential |

Finally, we assume (*guess*) that social distancing will result in a 50% reduction of contact with friends and "Other" interactions (as defined above).

With some quick arithmetic we arrive a the following parameters:

| Intervention | % reduction of social contact  |
|--|--|
| Schools Closings (PC)  | 4% |
| Close non-essential business (noness_SD) | 8% |
| PA Social Distance (PASD) | 15% | 

We then use the numbers above as inputs into CHIME's social distancing parameter.  

**CHIME's Results With The Social Distancing Parameter As Defined Above** 

|% reduction of social contact| Scenario | Peak Reduction*|
|--|--|--|
| 4% | PC | 15% |
| 12% | PC + noness_SD | 31%  |
| 15% | PASD  | 4%  |
| 31% | PC + noness_SD + PASD | 65%  |

*Peak Reduction refers to the % reduction in the number of critical care beds needed at the peak of the Critical Care Capacity Curve.

How Do the CHIME Results Compare To Imperial College's Results?
----
If CHIME predicts that school closings will result in a 15% peak reduction of the Critical Care Capacity Curve, how does that compare to the results of the Imperial College team?

Pulling the pertinant data from the Imperial College paper shows that their estimate of school closings (denoted as PC in the chart below) results in a 14% peak reduction in the Critical Care Capacity Curve.
 
From Table 3 in the Imperial College Team's paper:
![enter image description here](https://i.ibb.co/jbLrS1w/comparison-social.png)


The two models are predicting *very* similar outcomes for school closings.

Furthermore, if we compare the Imperial College Team's 33% reduction from social distancing (denoted as CI_HQ_SD in Table 3), this is very similar to CHIME's PASD category, which, when used as an input, predicts  a 42% reduction in the Critical Care Capacity Curve.

Lastly, by adding all of our interventions together...and one could argue this is similar to the Imperial College Team's full set of interventions...we see CHIME predicts a 65% reduction while the Imperial College Team predicts a 69% reduction in the Critical Care Capacity Curve.

Bottom line?  

The CHIME model (and associated assumptions) favorably compare with other validated SIR models.  Furthermore, the intuition around CHIME's social distancing parameter fits with these external models as well.


-- Penn Predictive Healthcare Team

