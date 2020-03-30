---
layout: post
title: CHIME 1.1.0 released, mid-growth stage updates
author: Michael Becker <michael.becker@pennmedicine.upenn.edu> & Corey Chivers <corey.chivers@pennmedicine.upenn.edu>
date:   2020-03-30 12:00:00 -0500
comments: true
tags: [healthcare, data, data science, forecasting, COVID]
---
# What has changed?
The original version of the CHIME model was built in the context of the first few days of a local outbreak. It was not well equipped to handle projections when there is a non-small number of current infections. Release [1.1.0](https://github.com/CodeForPhilly/chime/releases/tag/v1.1.0) addresses this by allowing the user to specify not only how many cases are currently hospitalized, but also, optionally, how long it has been since the first case was hospitalized. 

## Projecting the beginning of the outbreak

The previous version of the model assumed that today was the beginning of the outbreak which was causing the model to perform poorly as the epidemic progressed. The new version of CHIME places a vertical line to indicated today's date.

By default, the model will use the **Currently Hospitalized COVID-19 Patients** and the **Doubling time** to project backward to when the first hospitalization happened and fit the curve to these two points (the date of the first hospitalization and the today based on the current number of hospitalizations)

![image](https://user-images.githubusercontent.com/1069047/77951748-89294480-7298-11ea-8da7-6b796dd56e6d.png)

If however, you know the date when the first hospitalization happened you can click the checkbox **I know the date of the first hospitalized case** and enter this date. Then the model will estimate the average **Doubling time** for you based on this information and fit the SIR curve to these two points.

![image](https://user-images.githubusercontent.com/1069047/77951843-ae1db780-7298-11ea-8d67-616dda747e89.png)

Since we are still early in the epidemic these changes should not have a huge impact on your projections but as time goes on these errors would have compounded and resulted in incorrect projections. Now that we back-cast the curve to past data, you can easily evaluate how well the SIR model is fitting the local situation on the ground to help you decide if you need to update some of the parameters.


# Additional changes
You can see a full list of all the changes that went into the latest release on [GitHub](https://github.com/CodeForPhilly/chime/releases/tag/v1.1.0).

#### Sidebar cleanup
In addition to the model changes, we've also updated the order of the parameters in the sidebar to make things a little more organized.


#### CSV Downloads
We've added download links below each chart to download the raw data. This should help you with any analyses you need to do outside of CHIME.

# Thanks to all our contributors
We'd like to once again thank all of our [contributors](https://github.com/CodeForPhilly/chime/graphs/contributors) and everyone who has given us feedback about the app. We'd also like to call out [Phil Miller](https://github.com/PhilMiller) who provided a ton of extra support while we were trying to get this released. 

-- Penn Predictive Healthcare Team

