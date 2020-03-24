---
layout: post
title: How To Update CHIME Input Parameters Based on New COVID-19 Regional Observations
author: Mike Draugelis <michael.draugelis@pennmedicine.upenn.edu>
date:   2020-03-21 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

Last week, we began forecasting both admission rates and the number of patients who *would* be hospitalized with COVID-19.  The timing of this forecasting effort coincided (roughly) with the admission of the first COVID-19 patient into the UPENN health system.  Since we didn't yet have many data points for the model, we instead set parameters from regional reports and various publications.  

Now that a week has passed, we can take advantage of better regional data to produce more accurate forecasts from CHIME.

The point of this blog post is to demonstrate our thought process, and to show analysts how to recalculate parameters used as inputs by CHIME based on local observations to-date. Specifically, we’ll consider: 

 -  _Hospitalization %(total infections)_- the total % of COVID-19 patients requiring hospitalization
 - _Doubling Time_ estimate

The method we use to calculate both parameters is similar to a manual [least-squares](https://en.wikipedia.org/wiki/Least_squares) approach. 

Let's start with some motivation to explore these parameters:
* Our current assumption that 5% of all infected patients will be hospitalized comes from the [Verity](https://www.medrxiv.org/content/10.1101/2020.03.09.20033357v1.full.pdf) paper.  However, reading the recent [article from Nature](https://www.nature.com/articles/d41586-020-00822-x), we felt it was important to explore the impacts of the ratio of asymptomatic and symptomatic infected patients.  The Nature article suggests that the % of mild and asymptomatic infected patients could be as high as 50% which has implications on the ratio of patients that are hospitalized.  To take this into account, we’ll explore updates of our default value  for _Hospitalization %(total infections)_.
* Our clinical partners have stated they believe the doubling time is faster then our default of six. In addition there are [publications](https://arxiv.org/pdf/2003.06418.pdf) that cite doubling times between 2 and 4 days early in the spread.

I will describe a quick spreadsheet and CHIME analysis that is useful for estimating these two parameters.

Use a Spreadsheet to Estimate Hospitalization % of total infections
--------
Create a [spreadsheet](https://docs.google.com/spreadsheets/d/1GZpXQbm4gi5YZKI3-p7lvlJ1JcBIwyPPyUm1dJKuIE4/edit?usp=sharing) with columns like the one below:

![Spreadsheet estimate Pd5](https://i.ibb.co/RvLxgd4/spreadsheet-hop5.png)


1) Populate the spreadsheet with the past week's (or month's or whatever) observations (these are columns C and L above, in green).

2) Enter the assumed constants in the blue columns.  While it's likely different regions have different values, the values we're currently using are as follows: 
* (Col K) Rate of Detection = 10%
* (Col I) % Asymptomatic = 0
* (Col H) % Symptomatic = 100
* (Col G) % of Symptomatic that are Hospitalized = 5
* (Col F) Est Market Share = 15%

3) Fill in the last remaining columns (orange ones) with the following equations: 
* (Col J) Est of Total Infected = _Regional Known Infections_ /_Rate of Detection_
* (Col F) Estimated % Hospitalizations of Total Infected = _% of Symptomatic that are Hospitialzed_ * _% Symptomatic_
* (Col D) Est of Hospitalized = _Total Infected_ * _Est Market Share_ * _Est % Hospitalized_

4) Now compare the error between the _Estimated Current Hospitalizations_ (Col C) and the _Observed Current Hospitalizations_ (Col D). 

    Question: Can you adjust the parameters in blue to reduce the total error in column B?

5)  **One could use various parameters to reduce the error; such as Market Share or Assumed Rate of Detection.** Our Strategy:  Inspired by Nature's paper, Only modify (Col I) Asymptomatic Rate to effect around values of 40%-60%, and hold constant _Market Share_ and _Assumed Rate of Detection_.

6) We discovered that _Asymptomatic Rate_ values that minimized there were values between 50% and 60%, resulting in _% Hospitilizaed_ between 2.5 and  2.0.  We selected **2.5** as our hospitalization rate of infected patients since 50% was the high end estimate from the Nature article.

![Spreadsheet estimate Pd25](https://i.ibb.co/VYcDD8f/spreadsheet-hosp2-5.png)


Use CHIME to Estimate a More Accurate Doubling Time Parameter
-------

Now we're going to get a better estimate of the Doubling Time parameter by comparing CHIME's forecasted hospitalizations to the actual  _Observed Current Hospitalizations_.

In short, we're going to adjust the _Doubling Time_ parameter in CHIME and re-run CHIME until its output matches _Observed Current Hospitalizations_.

**A Note On the Social Distancing Parameter:**

Because the _Observed Current Hospitalizations_ are telling us who was infected 5-7 days ago, the _Social Distancing_ parameter may need to be changed accordingly.  The effects that Social Distancing has on the spread of the disease often takes a week (or more) before they are realized.

In our case, since we're looking at March 14 through March 21, we’ll set the _Social Distancing_ to zero (Do Nothing) over this period.  

See our [blog post](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) for a detailed exploration of social distancing.

**CHIME Parameters**

| Parameter | Value  |
|--|--|
| Day 0 | March 14, 2020 |
| Downtown Current Hospitalizations | 2 |
| Doubling Time | **First run 6, eventually we tried 4** |
| Social distancing | 0% |
| Hospitalization %(total infections) | 2.5 |
| ICU %(total infections) | 0.75 (30% of Hospitalized patients) |
| Ventilated %(total infections) | 0 (Only considering ICU)|
| Hospital Length of Stay | 8 |
| ICU Length of Stay| 16 |
| Vent Length of Stay | N/A |
| Hospital Market Share (%)| 15 |
| Regional Population | 3,600,000 |
| Currently Known Regional Infections | 33 |


In the first run of CHIME, we set the _Doubling Time_ to 6, based on the [publications](https://www.ncbi.nlm.nih.gov/pubmed/32007643) we were using at the time.  

| Doubling Time Six | Doubling Time Four  | 
|--|--|
| ![](https://i.ibb.co/rmxgwqw/doubling6.png) | ![](https://i.ibb.co/BcwKhms/doubling4.png) |
The doubling time scenario of six has slightly less error then the doubling time of four. For now, we’re opting to run scenarios bounded by a doubling time of four and six.

A _Doubling Time_ of 4 in Philadelphia?
--------
While [some sources](https://arxiv.org/pdf/2003.06418.pdf) cite doubling times between two and four days early in the spread, a four day doubling time is more aggressive than first assumed and deserves some scrutiny. However, it is essential to remember that this four-day estimate is the estimated doubling time *before* March 14.  Since then, state and local government officials enacted significant distancing measures (starting on March 15), that will slow the spread and increase the doubling time.
The doubling time is applied to the number of infections, not the number of confirmed cases. It is believed by some that the discrepancy between those two numbers might account for phenomena where we observed a much higher rate of doubling of confirmed cases (2-4 days at present). We remain on the lookout for definitive references that can address the rapid growth of positive cases in the US and Europe while accounting for the bias of missing positive cases.
Due to these social distancing policies, we're currently [estimating](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) a reduction of social contact by 30-40%.  

In the coming week, we expect to begin to see the impact of those social distancing policies.  We will then run another simulation with day zero set to March 22, 2020, and repeat the process described in this blog post.

If the current numbers hold, the current level of social distancing policies _could_ cut the surge peak by 50%.

This next week we'll continue to track the rate of infected and hospitalized to better understand the impact of our policies and to continue to refine our forecasts of potential demand.

-- Penn Predictive Healthcare Team


