---
layout: post
title: Announcing CHIME, A tool for COVID-19 capacity planning
author: Michael Becker <michael.becker@pennmedicine.upenn.edu>
date:   2020-02-13 12:00:00 -0500
comments: true
tags: [healthcare, AI, data, data science, machine learning, COVID]
---

There's been a lot of talk over the last few weeks about using models to predict the number of future COVID-19 patients (add examples). The most common technique for doing so is 
[Discrete-time SIR modeling](https://mathworld.wolfram.com/SIRModel.html). At Penn Medicine, we've developed a tool that leverages SIR modeling to assist hospitals with capacity planning around COVID-19.

## Say hello to CHIME
[![CHIME](https://user-images.githubusercontent.com/1069047/76693244-5e07e980-6638-11ea-9e02-1c265c86fd2b.gif)](https://pennchime.herokuapp.com/)

[CHIME](https://github.com/pennsignals/chime) (COVID-19 Hospital Impact Model for Epidemics) allows hospitals to enter information about their population and assumptions around the spread and seriousness of COVID-19. It then runs a standard SIR model to project the number of new hospital admissions each day along with the daily hospital census. These projections can then be utilized to create best and worst-case scenarios that can assist with capacity planning. We're announcing today that we're [open-sourcing CHIME](https://github.com/pennsignals/chime) and [making it available](https://pennchime.herokuapp.com/) to the healthcare community to assist in planning for this historical pandemic.

The most important parameter in a SIR model is the **Doubling Time**. This defines how rapidly a disease spreads. Estimates out of:

 * China shows a rate of around 6
 * South Korea is reporting a rate around 12
 * Italy currently estimates around 4.

The reason this value is of such importance is because of the exponential nature of the spread of infectious diseases like COVID-19. This is also why such a big emphasis is being put on measures like social distancing and hand washing. The more we can slow down the spread of COVID-19 the lower the peak demand on our healthcare system. Of course, you don't have to take our word for it. Try out [CHIME](https://pennchime.herokuapp.com/) and see what happens when you modify the **Doubling Time** parameter.

We've put in a lot of effort into coming up with good estimates for all the parameters to the model and have set default values accordingly. Some of the default values are based on the current situation in our home region of Philadelphia. If you're working somewhere outside of the Philadelphia region you can simply modify the following parameters to suit your patient population: 

* **Currently Known Regional Infections**
* **Currently Hospitalized COVID-19 Patients**
* **Hospital Market Share (%)**

As time moves on better estimates will be made for some of the values in CHIME. We will try out best to keep on to of the latest research and keep things up to date but if you find and issue with some of the values we're using we'd appreciate your [feedback](http://predictivehealthcare.pennmedicine.org/contact/) and [contributions](https://github.com/pennsignals/chime).