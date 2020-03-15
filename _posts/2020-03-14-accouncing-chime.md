---
layout: post
title: Announcing CHIME, A tool for COVID-19 capacity planning
author: Michael Becker <michael.becker@pennmedicine.upenn.edu> & Corey Chivers <corey.chivers@pennmedicine.upenn.edu>
date:   2020-03-14 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---

As we prepare for the additional strains that the [COVID-19 outbreak](https://www.cdc.gov/coronavirus/2019-nCoV/index.html) will place on our hospital system, our operational leaders need up-to-date projections of how many additional resources will be required. Informed estimates of how many patients will need hospitalization, ICU beds, and mechanical ventilation over the coming days and weeks will be a crutial input to readiness responses and mitigation strategies being enacted.

To this end, the [Predictive Healthcare](http://predictivehealthcare.pennmedicine.org/) team at Penn Medicine has developed a tool that leverages [SIR modeling](https://mathworld.wolfram.com/SIRModel.html) to assist hospitals with capacity planning around COVID-19.


##### Introducing CHIME: The **C**OVID-19 **H**ospital **I**mpact **M**odel for **E**pidemics.
[![CHIME](https://user-images.githubusercontent.com/1069047/76693244-5e07e980-6638-11ea-9e02-1c265c86fd2b.gif)](https://pennchime.herokuapp.com/)

[CHIME](https://github.com/pennsignals/chime) allows hospitals to enter information about their population and assumptions around the spread and seriousness of COVID-19. It then runs a standard SIR model to project the number of new hospital admissions each day along with the daily hospital census. These projections can then be utilized to create best and worst-case scenarios that can assist with capacity planning. We're announcing today that we're [open-sourcing CHIME](https://github.com/pennsignals/chime) and [making it available](https://pennchime.herokuapp.com/) to the healthcare community to assist in planning for this historical pandemic.

While the default parameters are customized, and continually updated to reflect the situation at Penn Medicine, [CHIME](https://github.com/pennsignals/chime) can be adapted for use by any hospital system by modifying parameters to reflect local contexts.

The most important parameter in an SIR model is the **Doubling Time**. This defines how rapidly a disease spreads. Experiences in other geographical contexts suggest that doubling time may range from 4 to 12 days, with notable examples::

 * China reports a rate of around 6 days
 * South Korea is reporting a rate around 12 days
 * Italy currently estimates around 4 days

The reason this value is of such importance is because of the exponential nature of the spread of infectious diseases like COVID-19. This is also why such a big emphasis is being put on measures like social distancing and hand washing. The more we can slow down the spread of COVID-19 the lower the peak demand on our healthcare system. [Try out our live version of CHIME](https://pennchime.herokuapp.com/) and see what happens when you modify the **Doubling Time** parameter. You can also experiment with scenarios involving different levels of incidence severity and average lengths of stay for each severity class.

We've put in a lot of effort into coming up with good estimates for all the parameters to the model and have set default values accordingly. Some of the default values are based on the current situation in our home region of Philadelphia. If you're working somewhere outside of the Philadelphia region you can simply modify the following parameters to suit your patient population: 

* **Currently Known Regional Infections**
* **Currently Hospitalized COVID-19 Patients**
* **Hospital Market Share (%)**

As local spread progresses, revised estimates can be made for some of the values in CHIME. We will try out best to keep on to of the latest research and keep things up to date but if you find and issue with some of the values we're using we'd appreciate your [feedback](http://predictivehealthcare.pennmedicine.org/contact/) and [contributions](https://github.com/pennsignals/chime).


-- Penn Predictive Healthcare Team
