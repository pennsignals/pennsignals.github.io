---
layout: post
title: Introducing a PPE Calculator for use with CHIME
author: ThaiBinh Luong <thaibinh.luong@pennmedicine.upenn.edu>
date:   2020-05-08 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID, PPE]
---
[CHIME](https://penn-chime.phl.io) was built to assist hospital systems project the resources that would be required due to the COVID-19 pandemic, primarily focusing on bed and ventilator capacity. 
A natural extension is to use the projected hospital censuses to evaluate the amount of personal protective equipment (PPE) needed. 
In our latest release, we include a PPE calculator--accessible on the CHIME website--that works in conjunction with your CHIME-generated projections.

## PPE forecasting

Personal protective equipment (PPE) such as N95 respirators, gloves, and isolation gowns are essential for the safety of both health care workers and their patients. 
Under normal circumstances, hospital administrators regularly place orders based on their “burn rate” with the assumption of reliable availability; the need for PPE forecasting is minimal.
However, when PPE supplies are stressed locally and worldwide, hospital systems are forced to adjust their usage strategies.
PPE forecasting becomes critical in determining how long a facility’s existing inventory will last and how many additional supplies will need to be procured to accommodate usage in the near future.

## An overview of the PPE Calculator

Together with the team listed below, we present a calculator that uses forecasted patient censuses to output daily and cumulative projections for each type of PPE. 
To account for increasingly strict usage policies, you can choose from a range of scenarios that subsequently adjust the amount of PPE consumed.
The underlying assumptions for these scenarios are based on quantitative data collection and qualitative interviews with front-line staff and hospital leadership at the Hospital of the University of Pennsylvania, but the calculator allows you to create your own custom scenarios based on the practice patterns at your facility.

The overall architecture of the calculator is summarized in the figure below:

![PPE_figure](/assets/images/blog/PPE_figure.png)

The calculator is implemented as an Excel file, and takes in as input the daily hospitalizations, ICU patients, ventilated patients, and admitted patients.
Although the PPE Calculator was designed with CHIME in mind, its inputs can be from any model that provides daily projections of the four listed categories of patients.
In the CHIME tool, after setting the parameters in the sidebar to generate your facility’s projections, the csv file download will match the input required for integration into the PPE calculator. 

Additional tutorials and details about the tool are available in the [CHIME user documentation](http://predictivehealthcare.pennmedicine.org/chime/ppe-calculator)

## Collaborators

The team primarily responsible for creating the PPE calculator comprises experts across a wide variety disciplines at the 
University of Pennsylvania (Department of Computer and Information Science, Wharton School, Perelman School of Medicine, 
Center for Health Incentives and Behavioral Economics) and Penn Medicine (Hospital of the University of Pennsylvania). 
Contributors include: Kristian Lum, James Johndrow, April Cardone, Barry Fuchs, Cody E. Cotner, Olivia Jew, Ravi B. Parikh, 
Gary E. Weissman, Christian Terwiesch, Kevin G. Volpp

## Additional changes
You can see all the changes incorporated in the latest releases ([1.1.4](https://github.com/CodeForPhilly/chime/releases/tag/v1.1.4), [1.1.5]) on GitHub.

## Thanks to all our contributors
We would like to thank all of our [contributors](https://github.com/CodeForPhilly/chime/graphs/contributors) for their continued support. As always, we welcome feedback. 

--Penn Predictive Healthcare Team

