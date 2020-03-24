---
layout: post
title: How To Update CHIME Input Parameters Based on New COVID-19 Regional Observations
author: Mike Draugelis <michael.draugelis@pennmedicine.upenn.edu>
date:   2020-03-22 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

Last week, we began forecasting both admission rates and the number of patients who *would* be hospitalized with COVID-19.  This forecasting coincided (roughly) with the admission of the first COVID-19 patient into the UPENN health system.  Since we didn't yet have many data points for the model, we instead set parameters from regional reports and various publications.  

Now that a week has passed, we can take advantage of better regional data to produce more accurate forecasts from CHIME.

The point of this blog post is to show analysts how to re-calculate two parameters used as inputs by CHIME: 

 -  _Hospitalization %(total infections)_- the total % of COVID-19 patients requiring hospitalization
 - _Doubling Time_ estimate

The method we use to calculate both parameters is similar to a manual [least-squares](https://en.wikipedia.org/wiki/Least_squares) approach. 

Let's start with some motivation to explore these parameters:
* Our current assumptions of 5% of all infected patients will be hospitilized comes from the [Verity](https://www.medrxiv.org/content/10.1101/2020.03.09.20033357v1.full.pdf) paper.  However, reading the recent [article from Nature](https://www.nature.com/articles/d41586-020-00822-x), we felt it was important to more explicit layer in our assumptions of the ratio of asymptomatic and symptomatic infected patient.  The Nature article suggests that the % of asymptomatic infected patients could be as high as 50% which as implication to the ratio of patients that are hospitilalized.  By considering this we can explore  update our default value  for _Hospitalization %(total infections)_.
* Our clinical partners have stated that they believe the doubling time of is fast then our default of six. In addition there are [publications](https://arxiv.org/pdf/2003.06418.pdf) that cite doubling times between 2 and 4 days early in the spread.

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
* (Col G) % of Symptomatic that are Hospitialzed = 5
* (Col F) Est Market Share = 15%

3) Fill in the last remaining columns (orange ones) with the following equations: 
* (Col J) Est of Total Infected = _Regional Known Infections_ /_Rate of Detection_
* (Col F) Estimated % Hospitalizations of Total Infected = _% of Symptomatic that are Hospitialzed_ * _% Symptomatic_
* (Col D) Est of Hospitalized = _Total Infected_ * _Est Market Share_ * _Est % Hospitalized_

4) Now compare the error between the _Estimated Current Hospitalizations_ (Col C) and the _Observed Current Hospitalizations_ (Col D). 

    Question: Can you adjust the parameters in blue to reduce the total error in column B?

5) Our Strategy:  Inspired by Nature's paper, we're only going to modify (Col I) Asymptomatic Rate to effect around values of 40%-60%.

6) We discovered that _Asymptomatic Rate_ values between 50% and 60%, resulting in _% Hospitilizaed_ between 2.0 and 2.5, reduced the error the most.  We selected **2.5** as our hospitalization rate of infected patients. 

![Spreadsheet estimate Pd25](https://i.ibb.co/VYcDD8f/spreadsheet-hosp2-5.png)


Use CHIME to Estimate a More Accurate Doubling Time Parameter
-------

Now we're going get a better estimate of the Doubling Time parameter by comparing CHIME's forecasted hospitalizations to the actual  _Observed Current Hospitalizations_.

In short, we're going to adjust the _Doubling Time_ parameter in CHIME and re-run CHIME until its output matches _Observed Current Hospitalizations_.

**A Note On the Social Distancing Parameter:**

Because the _Observed Current Hospitalizations_ are telling us who was infected 5-7 days ago, the _Social Distancing_ parameter may need to be changed accordingly.  The effects that Social Distancing has on the spread of the disease often takes a week (or more) before they are realized.

In our case, since we're looking at March 14 through March 21, I'm going to set the Social Distancing to zero (Do Nothing).  

See our [blog post](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) for a detailed exploration of social distancing.

**CHIME Parameters**

| Parameter | Value  |
|--|--|
| Day 0 | March 14, 2020 |
| Downtown Current Hospitalizations | 2 |
| Doubling Time | **First run 6, eventually we tried 4** |
| Social distancing | 0% |
| Hospitalization %(total infections) | 2.5 |
| ICU %(total infections) | 0.75 (30% of Hospitilized patients) |
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

The scenario with doubling time of six has slightly less error then the doubling time of four.  However, we opted to create reports using four it's last value on March 23rd is more aligned with our most recent observation and it's a more conservative bound.


A _Doubling Time_ of 4 in Philadelphia?
--------
While there are [publications](https://arxiv.org/pdf/2003.06418.pdf) that cite doubling times between two and four days early in the spread...four days is more aggressive than first assumed and deserves some scrutiny.

However, it is essential to remember that this four-day estimate is the estimated doubling time *before* March 14.  Since then, state and local government officials put significant distancing measures in place (starting on March 15), that will slow the spread and increase the doubling time.

Due to these social distancing policies, we're currently [estimating](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) a reduction of social contact by 30-40%.  

In the coming week, we'll begin to see the impact of those social distancing policies.  We will then run another simulation with day zero set to March 22, 2020, and repeat the process described in this blog post.

If the current numbers hold, we could cut the surge peak by 50%.

This next week we'll continue to track the rate of infected and hospitalized to understand the impact of our policies better and to continue to improve our forecasting.

-- Penn Predictive Healthcare Team
