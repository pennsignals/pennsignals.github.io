---
layout: post
title: Explore COVID-19 characteristics based on regional observations
author: Mike Draugelis <michael.draugelis@pennmedicine.upenn.edu>
date:   2020-03-22 12:00:00 -0500
comments: true 
tags: [healthcare, data, data science, forecasting, COVID]
---

Last week, we had begun forecasting both admission rates and the number of patients who *would* be hospitalized with COVID-19.  This forecasting coincided (roughly) with the admission of our first COVID-19 patient into the UPENN health system.  Since we didn't yet have many data points for our model, we instead selected parameters from regional reports and various publications.  

Two especially tricky parameters used as inputs by CHIME are the Rate of Detection (which must be calculated on a regional basis, based on local observations) and the Doubling Time (also not static, with a wide range of uncertainty).

Now that a week has passed, we can take advantage of better regional data to produce more accurate forecasts from CHIME.

The point of this blog post is to show analysts how to re-calculate the rate of detection and the doubling estimate to get this more accurate prediction.

I hope to show that a quick spreadsheet analysis is useful.


Using a Spreadsheet to Estimate A Rate Of Detection
--------
Create a spreadsheet with columns like the one below:

![Spreadsheet estimate Pd5](https://i.ibb.co/c14Htjg/spread-sheet-pd5.png)


Populate the spreadsheet with the past week's (or month's or whatever) observations (these are columns B and H above, in green).

Enter the assumed constants in the blue columns (columns D, E, and G).  While it's likely different regions have different values, the values we're currently using are as follows: 
* Rate of Detection i.e. _Probability of Detection_ = 5%
* _Est Market Share_ = 15%
* _Est % Hospitilized_ = 5%

Fill in the last remaining columns (C and F, aka the orange ones) with the following equations: 
* Est of Total Infected = _Regional Known Infections_ /_Rate of Detection_
* Est of Hospitalized = _Total Infected_ * _Est Market Share_ * _Est % Hospitilized_

Now compare the _Estimated Current Hospitalizations_ with _Observed Current Hospitalizations_.  If these two numbers are different, then your _Rate of Detection_ parameter is incorrect.

NOTE:  We're going to assume that the _Assumed Market Share_ and _Assumed % Hospitalizations_ are correct (the latter is based on several publications, and we have a relatively high degree of confidence in that number).

To correctly estimate the _Rate of Detection_, change it until the numbers in the current _Estimated Current Hospitalizations_ matches the numbers in _Observed Current Hospitalizations_.

In our example below, we had to change the _Rate of Detection_ from our initially assumed 5% up to 25%, a more accurate number, based on a week's worth of real-life observations.


![Spreadsheet estimate Pd25](https://i.ibb.co/VwpNhrX/spreadsheet-pd25.png)


Use CHIME to Estimate a More Accurate Doubling Time Parameter
-------

We're going to use CHIME's forecasted hospitalizations and compare them to the actual  _Observed Current Hospitilizations_ to get a better estimate of the _Doubling Time_ parameter.

In short, we're going to update the _Doubling Time_ parameter in CHIME and re-run CHIME until it's output match _Observed Current Hospitilizations_.

**A Note On The Social Distancing Parameter:**

Because the _Observed Current Hospitilizations_ are telling us who was infected 5-7 days ago, the _Social Distancing_ parameter may need to be changed accordingly.  The effects that Social Distancing has on the spread of the disease often takes a week (or more) before they are realized.

In our case, since we're looking at  March 14 through March 21, I'm going to set the Social Distancing to zero (Do Nothing).  This is because our distancing policies didn't go into effect until March 16-17.  

See our [blog post](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) for a detailed exploration of social distancing.

**CHIME Parameters**

| Parameter | Value  |
|--|--|
| Day 0 | March 14, 2020 |
| Downtown Current Hospitilizations | 1 (from spreadsheet estimatation) |
| Doubling Time | **First run 6, eventually we tried 3** |
| Social distancing | 0% |
| Market Share | 15% |
| Hospitalization %(total infections) | 5 |
| ICU %(total infections) | 1.5 |
| Ventilated %(total infections) | 0 (Only considering ICU)|
| Hospital Length of Stay | 8 |
| ICU Length of Stay| 18 |
| Vent Length of Stay | N/A |
| Hospital Market Share (%)| 15 |
| Regional Population | 3,600,000 |
| Currently Known Regional Infections | 33 |


In the first run of CHIME, we set the _Doubling Time_ to 6, based on the [publications](https://www.ncbi.nlm.nih.gov/pubmed/32007643) we were using at the time.  As you can see in the CHIME output below, the forecasted hospitalized COVID-19 cases (denoted 'hosp') does not match our observations in the spreadsheet above.  

**CHIME Output, Based on a _Doubling Time_ of 6**

![CHIME Ro 6: COVID Hospital Census](https://i.ibb.co/hMpyNPZ/chime-314-Ro6-census.png)

**CHIME Output, Based on a _Doubling Time_ of 3**

We then updated _Doubling Time_ to 3 and found that CHIME's forecasts are now much closer to the real-life hospitalizations.  

Going forward, for this next week, we will assume that a _Doubling Time_ of 3 is more accurate. 

A _Doubling Time_ of 3 in Philadelphia?
--------
While there are [publications](https://arxiv.org/pdf/2003.06418.pdf) that cite doubling times between 2 and 4 days early in the spread...3 days is much more aggressive than first assumed and therefore deserves some scrutiny.

However, it is essential to remember that this three-day estimate is the estimated doubling time *before* March 14th.  Since then, state and local government officials put significant distancing measures in place (starting on March 15), that will slow the spread and increase the doubling time.

Due to these social distancing policies, we're currently [estimating](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) a reduction of social contact by 23-30%.  

In the coming week, we'll begin to see the impact of those social distancing policies.  We will then run another simulation with day zero set to March 22, 2020, and repeat the process described in this blog post.

If the current numbers hold, we could cut the surge peak by 50%.

This next week we'll continue to track the rate of infected and hospitalized to understand the impact of our policies better and to continue to improve our forecasting.

-- Penn Predictive Healthcare Team