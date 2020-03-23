---
layout: post
title: CHIME 0.5.0 released with major updates
author: Michael Becker <michael.becker@pennmedicine.upenn.edu> & Corey Chivers <corey.chivers@pennmedicine.upenn.edu>
date:   2020-03-23 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---
# What was fixed

Unfortunately, the COVID-19 crisis forces us to move quickly and one downside of moving quickly is it's easier to make mistakes. Our latest release of CHIME contains a [major bug](https://github.com/CodeForPhilly/chime/issues/189) fix to the way we were calculating daily admissions and census. In the previous version of CHIME, we were not properly accounting for recovered patients (previously infected) patients in our accounting of newly admitted patients. This was resulting in an **undercount** of admissions by a factor of ~1.4-2.2. Since this error was compounding over time, this impacted the short-term projections (next month) less than the longer-term projections. You can find an example of the impact of this bug below.

## Admissions
### Before
![Admissions Before](https://user-images.githubusercontent.com/1069047/77306042-6d88d180-6ccd-11ea-9009-736e46e1817f.png)

### After
![Admissions After](https://user-images.githubusercontent.com/1069047/77306166-a45ee780-6ccd-11ea-9487-53f44271f768.png)

## Census
### Before
![Census Before](https://user-images.githubusercontent.com/1069047/77306247-c8222d80-6ccd-11ea-84ed-c2e22fb1eda9.png)

### After
![Cesus After](https://user-images.githubusercontent.com/1069047/77306298-d8d2a380-6ccd-11ea-8c88-6871133e8e88.png)



# What should you do
You should immediately update your reports and notify your stakeholders of the updated projections. We're sorry that this bug made it into CHIME but we're glad that it was found so quickly. While we'd like to think there are no more errors in CHIME we know that there could be. Please check back here for regular updates to make sure you're always getting the best estimates of your capacity needs.

# Thank you to the community
The quick identification of this bug helps give us confidence that releasing CHIME as an open-source project was the right choice to make. We'd like to personally thank William Rose, Dave House, and Michael Bromley who each independently identified this bug and reported it to us via our [Slack channel](https://codeforphilly.org/chat/covid19-chime-penn). We'd also like to thank Phil Miller who helped out with verifying our fix was correct. The support of the community is crucial to our response to this crisis and we are eternally grateful for your help!

If you believe you have found a bug in CHIME please notify us in #chime-analysis on Slack or [file an issue](https://github.com/CodeForPhilly/chime/issues) in our GitHub repo.

-- Penn Predictive Healthcare Team

