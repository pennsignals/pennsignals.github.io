---
layout: post
title: Updating CHIME Input Parameters Based on New COVID-19 Regional Observations
author: Mike Draugelis <michael.draugelis@pennmedicine.upenn.edu>
date:   2020-03-24 08:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

Last week, we [began forecasting](http://predictivehealthcare.pennmedicine.org/2020/03/14/accouncing-chime.html) the potential levels of demand for hospital resources that could result from the outbreak with COVID-19. The timing of this forecasting effort coincided within two days of the admission of the first COVID-19 patient into the UPenn health system. Since we didn't yet have many data points for the model, we instead set parameters from regional reports and various publications.

Now that a little over a week has passed, we can take advantage of better regional data to produce more accurate forecasts from [CHIME](https://penn-chime.phl.io/).

The aim of this blog post is to demonstrate our thought process, and to show analysts how to recalculate parameters used as inputs by [CHIME](https://penn-chime.phl.io/) based on local observations to date. Specifically, we’ll consider:

 -  _Hospitalization %(total infections)_ - The total % of COVID-19 patients requiring hospitalization
 - _Doubling Time_ estimate

The method we use to calculate both parameters is similar to a manual [least-squares](https://en.wikipedia.org/wiki/Least_squares) approach.

Let's start with some motivation to explore these parameters:
* Our current assumption that 5% of all infected patients will be hospitalized comes from the [Verity et al](https://www.medrxiv.org/content/10.1101/2020.03.09.20033357v1.full.pdf) paper. However, more recent studies [cited by a Nature news article](https://www.nature.com/articles/d41586-020-00822-x) suggest that it may be important to consider the impacts of the ratio of asymptomatic and symptomatic infected patients. These studies suggest that the percentage of mild and asymptomatic infected patients could be as high as 50%. This has implications for how we estimate the percentage of infected patients requiring hospitalization. To take this into account, we’ll explore updates of our default value for _Hospitalization %(total infections)_.
* Our clinical partners have stated they believe the doubling time is faster than our default of six days. In addition, there are [publications](https://arxiv.org/pdf/2003.06418.pdf) that cite doubling times between 2 and 4 days early in the spread.

Using a Spreadsheet to Estimate Hospitalization % of total infections
--------
Create a [spreadsheet](https://docs.google.com/spreadsheets/d/1GZpXQbm4gi5YZKI3-p7lvlJ1JcBIwyPPyUm1dJKuIE4/edit?usp=sharing) with columns like the one below:

![Spreadsheet estimate Pd5](https://i.ibb.co/RvLxgd4/spreadsheet-hop5.png)


1) Populate the spreadsheet with the past week's (or month's or whatever) observations (these are columns C and L above, in green).

2) Enter the assumed constants in the blue columns.  While it's likely that different regions have different values, the values we're currently using are as follows: 
* (Col E) Estimated Market Share = 15%
* (Col G) % of Symptomatic that are Hospitalized = 5
* (Col H) % Symptomatic Infected = 100
* (Col I) % Asymptomatic Infected = 0
* (Col K) Rate of Detection = 10%

3) Fill in the last remaining columns (orange ones) with the following equations: 
* (Col F) Estimated % Hospitalizations of Total Infected = _% of Symptomatic that are Hospitialzed_ * _% Symptomatic Infected_ (Col G * Col H)
* (Col J) Estimate of Total Infected = _Regional Known Infections_/_Rate of Detection_ (Col K/Col L)
* (Col D) Estimated Current Hospitalizations = _Estimate of Total Infected_ * _Estimated Market Share_ * _Estimated % Hospitalized_ (Col J * Col E * Col F)

4) Now compare the error between the _Estimated Current Hospitalizations_ (Col D) and the _Observed Current Hospitalizations_ (Col C). 

Goal: Can you adjust the parameters in blue to reduce the Estimated Error in column B? One could use various parameters--such as Market Share or Assumed Rate of Detection--to reduce the error.

5) Our Strategy, inspired by the Nature news article mentioned above: Only modify _% Asymptomatic Infected_ (Col I) to values around 40%-60%, and hold these parameters constant: _Market Share_ and _Assumed Rate of Detection_.

6) We discovered that setting _% Asymptomatic Infected_ (Col I) between 50% and 60% minimized the Estimated Error, resulting in _% Hospitilized_ between 2.5 and 2.0. We selected **2.5** as our hospitalization rate of infected patients since 50% was the high end estimate from the Nature news article.

![Spreadsheet estimate Pd25](https://i.ibb.co/VYcDD8f/spreadsheet-hosp2-5.png)


Using CHIME to Estimate a More Accurate Doubling Time Parameter
-------

Now we're going to get a better estimate of the Doubling Time parameter by comparing CHIME's forecasted hospitalizations to the actual _Observed Current Hospitalizations_.

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


In the first run of CHIME, we set the _Doubling Time_ to 6, based on the [publication](https://www.ncbi.nlm.nih.gov/pubmed/32007643) we were using at the time.  

| Doubling Time Six | Doubling Time Four  | 
|--|--|
| ![](https://i.ibb.co/rmxgwqw/doubling6.png) | ![](https://i.ibb.co/BcwKhms/doubling4.png) | 

The doubling time scenario of six has slightly less error then the doubling time of four. For now, we’re opting to run scenarios bounded by a doubling time of four and six.

While [some sources](https://arxiv.org/pdf/2003.06418.pdf) are citing doubling times between two and four days early in the spread, it is essential to remember that this four-day estimate is the estimated doubling time *before* March 14.  Since then, state and local government officials enacted significant distancing measures (starting on March 15), that will slow the spread and increase the doubling time. Furthermore, doubling time in the simulation is applied to rate of growth of _all_ new infections, not only the number of confirmed cases. As testing effort increases, confirmed cases can grow faster than the actual infections. We remain on the lookout for definitive references that can address the rapid growth of positive cases in the US and Europe while accounting for the bias of missing positive cases.

Due to these social distancing policies, we're currently [estimating](http://predictivehealthcare.pennmedicine.org/2020/03/18/compare-chime.html) a reduction of social contact by 30-40%.  In the coming week, we expect to begin to see the impact of those social distancing policies.  We will then run another simulation with day zero set to March 22, 2020, and repeat the process described in this blog post. If the estimated distancing effect holds, the current level of social distancing policies _could_ cut the surge peak by more than 50%.

Next week we'll continue to track the rate of infected and hospitalized to better understand the impact of our policies and to continue to refine our forecasts of potential demand.

-- Penn Predictive Healthcare Team


