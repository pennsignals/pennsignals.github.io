---
layout: post
title: From machine learning to decisions
author: Corey Chivers, PhD <corey.chivers@uphs.upenn.edu>
date:   2017-11-07 12:00:00 -0500
comments: true
tags: [healthcare, AI, data, data science, machine learning, decision theory, utility, uncertainty]
---

The goal of data science in health care is to build systems which make use of data to help patients and physicians make the best possible decisions about their health. One way that we have approached this challenge at [Penn Medicine Predictive Healthcare](http://predictivehealthcare.pennmedicine.org/) is to employ machine learning to predict which patients are at elevated risk of adverse events (for [example sepsis](http://predictivehealthcare.pennmedicine.org/projects/sepsis/), [readmissions](https://www.pennmedicine.org/news/news-blog/2017/august/reducing-avoidable-readmissions-by-extending-care-beyond-the-hospital)) at any given moment. The resulting algorithms, built on a large collection of past cases, take in a variety of data points including a patient's demographic information, vital signs, lab values, hospital utilization and diagnosis history. From these data points, the algorithm looks for patterns that suggest that the patient is at elevated risk. The result, however, is a risk _score_, not a _decision_. Being presented with such a score invariably leads to the following (non-exhaustive) types of questions:

1. How high does the score need to be before some intervening action should be taken?
2. Will the prediction sometimes be wrong, and if so would we be better off without it?
3. How much better off would we be if we could improve the algorithm?

In order to go from a machine learning model which generates a risk score to an actual _decision_ about what to do with it, we need to think about how we the [expected utility](https://plato.stanford.edu/entries/rationality-normative-utility/) of our options. This post provides a gentle introduction to making decisions in situations of uncertainty using the concept of expected utility, then demonstrates how to apply the same thinking to risk models in predictive healthcare applications.


### Expected Utility

Expected utility can be thought of as the mathematical formulation of how much benefit (eg utility) you can expect to get when the outcome of an event is uncertain. It requires two components:

1. An estimate or evaluation of the benefit (utility) you would get for each of a range of possible outcomes.
2. An estimate of the probability of each of the possible outcomes.

Take for example a trick or treater picking candy from a bowl. There are two types of candy in the bowl, \\( \frac{1}{3} \\) are peanut butter cups, and the other \\( \frac{2}{3} \\) are raisinets. The trick or treater is from the planet earth and therefore prefers peanut butter cups to raisinets by a factor of 5. We can assign the utility of peanut butter cups a value of 5 and raisinets utility of 1.

What is the trick or treater's expected utility of picking candy at random from this bowl?

\\(\frac{2}{3} \\)rds of the time they'll get a raisinets and the associated 1 unit of utility, the other \\( \frac{1}{3} \\)rd of the time, they'll score and get peanut butter cups (utility=5), the expectation is therefore:

\\( 1(\frac{2}{3}) + 5(\frac{1}{3}) = \frac{7}{3} = 2.33 \\)

With this in hand, we can ask a variety of interesting questions, for example: 

- If the trick or treater has the option to choose from this bowl A or some other bowl B, which one should she choose?

Let's work through this question to see how the concept of expected utility helps us decide. Suppose bowl B contains \\( \frac{1}{2} \\) peanut butter cups, and \\( \frac{1}{2} \\) [rockets, or as my American colleagues call them: "smarties"](http://orgjunkie.com/2010/12/rockets-and-smarties.html). Our trick or treater likes these even less than raisinets, and assigns them a utility of \\( \frac{1}{10} \\). The expected utility of a random candy from bowl B therefore:

\\( 5(\frac{1}{2}) + (\frac{1}{10})(\frac{1}{2}) = 2.55 \\)

Which is more than the expected utility from the first bowl. Given the option to draw random candies from bowl A or bowl B, our trick or treater would be better off by choosing bowl B, since it has the higher expected utility. 

- How many more peanut butter cups would need to be added to bowl A before it became a better option than bowl B?

I leave it to the reader to solve this one, but we can see that using the logic of expected utility, we can compare an array of alternative scenarios, each of which consists of uncertain outcomes.

The key equations are quite straightforward \\( \dagger \\). For \\( I \\) possible outcomes, the probability associated with outcome \\( x_i \\) is \\( p(x_i) \\). The utility of outcome \\( x_i \\) is \\( U(x_i) \\).

$$
\mathbb{E}[U] = \sum_{i=0}^{I}{p(x_i)U(x_i)},
$$

Where

$$
\sum_{i=0}^{I}{p(x_i)} = 1
$$


Great! We've made it this far. Let's have some candy before continuing.

<img src="https://user-images.githubusercontent.com/1396669/32462118-3a843982-c306-11e7-9aaa-07ffa683f279.png" width="80%">

### Application to risk models

A risk model that predicts whether a given event will happen or not (eg sepsis/not-sepsis) generates probabilities associated with 4 possible outcomes:

1. True positive (TP)
2. True negative (TN)
3. False positive (FP)
4. False negative (FN)

This collection of outcomes is analogous to a bowl full of 4 different kinds of candies for which we derive different amounts of utility, where the mix is determined by the probabilities associated with each. We'll look at an example of how we can plug in values for the utilities in a predictive healthcare application below. With this formulation, we can now apply our logic of expected utility to this situation by modeling the expected benefits/costs (eg utility/dis-utility) of each outcome and plugging them into the expected utility equation.


$$
\mathbb{E}[U] = p(TP)U(TP) + p(TN)U(TN) + p(FP)U(FP) + p(FN)U(FN)
$$


So, a predictive model is kind of like a bowl of candies. There is a collection of possible outcomes, each of which occurs with some quantified probability, and each outcome is associated with some level of utility.

### Decision Theory

Decision theory is simply the application of expected utility to determine the best action (decision) from an array of alternatives (ie different bowls of candy). The best action is to take the one which **maximizes the expected utility**.

For a given risk model and population, the probabilities associated with each of the four outcomes above is a function of the threshold \\( t \\) we set to discriminate between predicted positives and predicted negatives. We can vary the threshold to generate a suite of alternatives. These alternatives are analogous to various bowls of candy, each with different compositions of candy types. We then choose from this suite of alternatives by selecting the one which maximizes the expected utility:

$$
\underset{t}{\mathrm{arg\,max}}\, \mathbb{E}[U]_t
$$

Which we can find either numerically, or by solving  \\( \frac{d}{dt} \mathbb{E}[U]_t = 0 \\).

#### Estimating utility of each of the four possible outcomes

The utility associated with each of the four possible outcomes of a risk model is dependent on the case at hand \\( \ddagger \\). Unlike candy, for which we have subjective preferences, the utility of each of the different outcomes in a predictive healthcare application will have associated utilities that can be modeled by breaking them each down into their component parts.

Let's look at one example of modeling the utilities of the outcomes. In this example, we have a risk model for some bad event that we would like to predict so that we can deploy an intervention to avoid or mitigate the cost associated with it. A positive prediction triggers the intervention. The intervention has some efficacy on true positive cases and some cost associated with false positives. Note that here we're switching from talking about utility to talking about cost, however, we can think of cost simply as negative utility.

* There is some cost associated with each intervention (staff costs, materials cost, etc.), \\( C_{intervention} \\)
* There is a cost associated with the bad event that we are seeking to avoid, \\( C_{event} \\)
* There is a cost incurred in terms of harm when the intervention is given in cases that are not true positives, \\( C_{harm} \\)

Ideally, we would like for every intervention to avert the bad event from happening, but unfortunately, that is unlikely to be the case. Instead, we introduce a term for the *efficacy* of the intervention \\( E \\). 
Our model of utility then becomes:

* **True Negatives**: no cost as no intervention is done on these patients and the bad event did not occur.
* **False Positives**: intervention cost is incurred along with the potential for harm, no bad events are averted. 
* **False Negatives**: bad event cost is incurred, but there was no intervention cost.
* **True Positives**: intervention cost is incurred, and only the proportion of interventions that are non-efficacious result in the bad event.

$$
-U(outcome) = Cost = \begin{bmatrix}
    0           & C_{intervention} + C_{harm} \\
    C_{event}   & C_{intervention} + (1-E)C_{event}
\end{bmatrix}
$$

To get the expected utility, we multiply by the probability of each outcome:

$$
P(outcome) = \begin{bmatrix}
    P(TN)       & P(FP)  \\
    P(FN)       & P(TP)
\end{bmatrix}
$$

and sum the result.

$$
-\mathbb{E}[U] = \sum_{i=1}^{2} \sum_{j=1}^2 U(outcome_{ij}) P(outcome_{ij}) 
$$

With this in hand, we can begin to ask interesting questions about the tradeoffs between the various components of the system. We can also stress test our expectations against wide ranges of values over those quantities about which we are uncertain. For example

- The efficacy of the intervention may not be known. We can evaluate what level of efficacy is required in order to expect a higher utility from our system than from some alternative (for instance treat all, treat none, or the status quo). 
- At what level of cost associated with the intervention would it no longer be worth it?
- How much additional benefit would we get with an improved model (ie higher \\( p(TP) \\), lower \\( p(FP) \\) and lower \\( p(FN) \\))?

#### Assume, evaluate, refine, repeat

It should be noted that the above model of costs is just one possible model, and undoubtedly makes simplifying assumptions. There is nothing stopping us, however, from repeating the exercise using different assumptions or adding  additional complexity/realism. Questions of the sort "what if the false positives lead to additional harm?" are easily incorporated. Further, once incorporated, the question becomes a more precise one, namely: "at what level of additional harm due to false positives would we be better off not using the risk model to deploy interventions, instead choosing some alternate strategy?" These questions become answerable in the most coherent and rigorous way possible when using the framework of expected utility maximization. 

That is not to say that these answers are infallible -- they are still conditional on the assumptions that we've made  and on the uncertainties associated with the component parts. Rather, they are the _best possible answers_ to the _most precisely formulated questions_, when starting from a _given set of assumptions_.  The success of data science applications in healthcare depends on our engagement in a process of continuous and close collaboration between data scientists, clinicians, and patients. By working together to transparently lay out goals and assumptions, we can evaluate the best alternative under those assumptions. As additional information becomes available, assumptions can be refined and re-evaluated. 

<br>
<br>
<br>
<br>
#### Footnotes:

\\( \dagger \\) In the continuous case (eg where there is instead one candy type, but the size \\( x \\) is, for instance, normally distributed within the bowl) where \\( x \in \mathbb{R} \\) and \\( U \\) is a function of \\( x \\), we can replace the summation for integration:

$$
\mathbb{E}[U] = \int_{-\infty}^{\infty}{p(x)U(x)\,dx},
$$

Where

$$
\int_{-\infty}^{\infty}{p(x)\,dx} = 1
$$

\\( \ddagger \\) An interesting feature of the exercise, however, is that the solution of the optimal threshold is invariant to the scale of \\( U \\). That is, we don't strictly need to come up with an absolute estimate of utility, but rather need only to define the _relative_ utilities associated with each outcome.
