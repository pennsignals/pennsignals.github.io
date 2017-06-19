---
layout: page
title: Penn Medicine Sepsis Solution
permalink: /projects/sepsis/
slug: projects
---
<div class="team-member col s12 m8 offset-m2 l6 offset-l3">
  <div class="card-panel grey lighten-5 z-depth-1">
    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/umsheid.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Craig Umscheid, MD, MSCE </h4>
          <h5>Director of the center for evidence-based practice at the university of Pennsylvania health system</h5>
          <p>Dr. Craig Umscheid is the sepsis solution clinical and project lead.</p>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/donnelly.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Patrick Donnelly, RN, MS, CCRN</h4>
          <h5>Director of the center for evidence-based practice at the university of Pennsylvania health system</h5>
          <p>University of Pennsylvania health system resuscitation manager.</p>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/corey.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Corey Chivers, Ph.D</h4>
          <h5>Senior data scientist</h5>
          <p>Corey Chivers is a senior data scientist on the penn medicine predictive healthcare team.</p>
        </div>
      </div>
    </div>

  </div>
</div>
<p>Inpatients who develop Sepsis can incur several additional weeks in the hospital at estimated costs totaling $30 billion annually in the United States. Sepsis strikes up to three million Americans each year.</p>

<h3>Sever Sepsis / Septic Shock Early Warning System 2.0</h3>
<p>The Early Warning System 2.0 is an advanced predictive system which uses patient vital signs, labs, and demographics to provide early warning of potential patient deterioration. This system uses machine learning in combination with vast amounts of individual patient data to discover patterns associated with impending patient deterioration.</p>

<p>The machine learning algorithm is trained on over 500 patient variables. The word cloud shows the 25 most important variables:</p>
<img class="responsive-img" src="/assets/images/word-cloud.png">

<p>See below for details on the patient population, definition of severe sepsis label used to train the algorithm, details on the algorithm performance, and finally a ranking of the patient population:</p>

<h3>Patient Population</h3>
<p>Age > 18 years<br />
<br />
In hospital for  > 24 hours<br />
<br />
Exclusions:</p>
<ul>
  <li>Services: 'NEWBORN','OBSTETRICS', 'CLINICAL RESEARCH UNIT'</li>
  <li>Units: ORs, ICUs, EDs</li>
  <li>Patients with a DNR-B or DNR-C order (DNR-A is included)</li>
</ul>

<h3>Severe Sepsis Label</h3>
<p>We trained the algorithm to detect patients who are about to progress from a pre-septic state or septic state to severe sepsis or septic shock. To do this, we searched all patient stays between July 2011 and June 2014 (n = 162,212). To be labeled positive, patients needed to have ICD9 codes '995.92' (Severe Sepsis) or '785.52' (Septic Shock) as well as meet specific physiological criteria to define a fixed time of onset:</p>

<h5>Physiological "Time Zero":</h5>
<p>Blood Culture Positive AND ( Lactic Acid Level > 2.2 OR Systolic BP < 90 mm Hg)</p>
<p>A total of 943 patients met both the physiological criteria and were coded with Severe Sepsis or Septic Shock.</p>

<h3>Cross Validation Performance</h3>
<p>Sensitivity (or true positive rate): 0.79 +/- 0.07 (trained over 3507 patients, 943 positive cases)</p>
<p>See below for model details.</p>

<h3>Operational Performance</h3>
<p>We ran the model over a 3-month validation period during Oct 1st — Dec 1st 2015 which included 10,448 patient encounters. The predictive model alerted on average 10 patients a day and those patients had the following outcomes:</p>
<ul>
  <li>13% of alerted patients died,</li>
  <li>26% were transferred to the ICU,</li>
  <li>46% Dx Sepsis</li>
  <li>28% met the CMS physiological criteria for severe sepsis or septic shock</li>
  <li>Alert occurred 30 hrs before ICU transfer</li>
</ul>
<p>We also ran the model over a retrospective period encompassing July-September 2014. In this period, there were 20 cases of severe sepsis or septic shock in which the patients met both the physiological definition while not in an ICU and were coded with Severe Sepsis or Septic Shock.
</p>
<p>Our model correctly identified 17 of these 20 patients (85%) with 10 alerts per day, compared with EWS 1.0 which identified 9 of 20 (45%) at 6 alerts per day. Additionally, our model identified these patients earlier, with a median lead time of 30.5 hours, compared to 2.5 hours for EWS 1.0.</p>

<p>EWS 1.0 Sensitivity = 45%, Specificity = 97%</p>
<p>EWS 2.0 Sensitivity = 85%, Specificity = 94%</p>

<h3>Top 100 Most Important Features</h3>
<p>The top 100 features by importance out of the 587 features used by the algorithm. Features include time-series inputs (eg Heart Rate (beats/min)), derived time-series statistics and trends (eg 24h Rate of Change), as well as constants (eg Height, Weight, AGE, etc).</p>

<table class="striped">
  <thead>
    <tr>
      <th>&nbsp;</th>
      <th>Feature</th>
      <th>Importance</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>BP Noninvasive Diastolic (mm Hg)</td>
      <td>0.016243</td>
    </tr>
    <tr>
      <td>2</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ min 24h</td>
      <td>0.016061</td>
    </tr>
    <tr>
      <td>3</td>
      <td>SERVICE_DESCRIPTION &gt;&gt;&gt; PULMONARY</td>
      <td>0.015547</td>
    </tr>
    <tr>
      <td>4</td>
      <td>Heart Rate (beats/min) +++ RoC 24h</td>
      <td>0.014558</td>
    </tr>
    <tr>
      <td>5</td>
      <td>Blood Urea Nitrogen</td>
      <td>0.013726</td>
    </tr>
    <tr>
      <td>6</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ minus_mean...</td>
      <td>0.013702</td>
    </tr>
    <tr>
      <td>7</td>
      <td>Temperature (degrees F)</td>
      <td>0.013580</td>
    </tr>
    <tr>
      <td>8</td>
      <td>Temperature (degrees F) +++ max 24h</td>
      <td>0.013252</td>
    </tr>
    <tr>
      <td>9</td>
      <td>% Monocyte Automated</td>
      <td>0.013156</td>
    </tr>
    <tr>
      <td>10</td>
      <td>Temperature (degrees F) +++ var 24h</td>
      <td>0.012669</td>
    </tr>
    <tr>
      <td>11</td>
      <td>Blood Urea Nitrogen +++ mean 24h</td>
      <td>0.012642</td>
    </tr>
    <tr>
      <td>12</td>
      <td>Heart Rate (beats/min)</td>
      <td>0.011829</td>
    </tr>
    <tr>
      <td>13</td>
      <td>Blood Urea Nitrogen +++ min 24h</td>
      <td>0.011650</td>
    </tr>
    <tr>
      <td>14</td>
      <td>Blood Urea Nitrogen +++ max 24h</td>
      <td>0.011416</td>
    </tr>
    <tr>
      <td>15</td>
      <td>AGE</td>
      <td>0.011090</td>
    </tr>
    <tr>
      <td>16</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ min 24h</td>
      <td>0.010927</td>
    </tr>
    <tr>
      <td>17</td>
      <td>Carbon Dioxide</td>
      <td>0.010580</td>
    </tr>
    <tr>
      <td>18</td>
      <td>Creatinine</td>
      <td>0.010472</td>
    </tr>
    <tr>
      <td>19</td>
      <td>Absolute Lymphocyte Count</td>
      <td>0.010463</td>
    </tr>
    <tr>
      <td>20</td>
      <td>Temperature (degrees F) +++ minus_mean 24h&nbsp;</td>
      <td>0.009596</td>
    </tr>
    <tr>
      <td>21</td>
      <td>Temperature (degrees F) +++ RoC 24h</td>
      <td>0.009590</td>
    </tr>
    <tr>
      <td>22</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ var 24h&nbsp;</td>
      <td>0.009372</td>
    </tr>
    <tr>
      <td>23</td>
      <td>Bilirubin Total</td>
      <td>0.009272</td>
    </tr>
    <tr>
      <td>24</td>
      <td>Creatinine +++ mean 24h</td>
      <td>0.008993</td>
    </tr>
    <tr>
      <td>25</td>
      <td>Absolute Monocyte Count</td>
      <td>0.008889</td>
    </tr>
    <tr>
      <td>26</td>
      <td>Heart Rate (beats/min) +++ var 24h</td>
      <td>0.008812</td>
    </tr>
    <tr>
      <td>27</td>
      <td>Creatinine +++ max 24h</td>
      <td>0.008754</td>
    </tr>
    <tr>
      <td>28</td>
      <td>Heart Rate (beats/min) +++ minus_mean 24h</td>
      <td>0.008637</td>
    </tr>
    <tr>
      <td>29</td>
      <td>Creatinine +++ min 24h</td>
      <td>0.008626</td>
    </tr>
    <tr>
      <td>30</td>
      <td>Temperature (degrees F) +++ mean 24h</td>
      <td>0.008606</td>
    </tr>
    <tr>
      <td>31</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ mean 24h</td>
      <td>0.008346</td>
    </tr>
    <tr>
      <td>32</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ RoC 24h</td>
      <td>0.008200</td>
    </tr>
    <tr>
      <td>33</td>
      <td>Anion Gap +++ mean 24h</td>
      <td>0.008188</td>
    </tr>
    <tr>
      <td>34</td>
      <td>% Neutrophil Automated</td>
      <td>0.008091</td>
    </tr>
    <tr>
      <td>35</td>
      <td>Heart Rate (beats/min) +++ max 24h</td>
      <td>0.007872</td>
    </tr>
    <tr>
      <td>36</td>
      <td>Red Cell Distribution Width</td>
      <td>0.007762</td>
    </tr>
    <tr>
      <td>37</td>
      <td>% Lymphocyte Automated</td>
      <td>0.007729</td>
    </tr>
    <tr>
      <td>38</td>
      <td>White Blood Cell</td>
      <td>0.007547</td>
    </tr>
    <tr>
      <td>39</td>
      <td>Anion Gap +++ max 24h</td>
      <td>0.007504</td>
    </tr>
    <tr>
      <td>40</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ mean 24h</td>
      <td>0.007416</td>
    </tr>
    <tr>
      <td>41</td>
      <td>White Blood Cell +++ min 24h</td>
      <td>0.007408</td>
    </tr>
    <tr>
      <td>42</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ minus_mea...</td>
      <td>0.007380</td>
    </tr>
    <tr>
      <td>43</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ var 24h</td>
      <td>0.007198</td>
    </tr>
    <tr>
      <td>44</td>
      <td>White Blood Cell +++ mean 24h</td>
      <td>0.007092</td>
    </tr>
    <tr>
      <td>45</td>
      <td>WEIGHT_LBS</td>
      <td>0.007027</td>
    </tr>
    <tr>
      <td>46</td>
      <td>Alkaline Phosphatase</td>
      <td>0.006879</td>
    </tr>
    <tr>
      <td>47</td>
      <td>Platelet +++ mean 24h</td>
      <td>0.006779</td>
    </tr>
    <tr>
      <td>48</td>
      <td>White Blood Cell +++ max 24h</td>
      <td>0.006759</td>
    </tr>
    <tr>
      <td>49</td>
      <td>SpO2 (%) +++ var 24h</td>
      <td>0.006729</td>
    </tr>
    <tr>
      <td>50</td>
      <td>Platelet +++ min 24h</td>
      <td>0.006712</td>
    </tr>
    <tr>
      <td>51</td>
      <td>WBC Corrected</td>
      <td>0.006659</td>
    </tr>
    <tr>
      <td>52</td>
      <td>Bilirubin Direct</td>
      <td>0.006627</td>
    </tr>
    <tr>
      <td>53</td>
      <td>Temperature (degrees F) +++ min 24h</td>
      <td>0.006579</td>
    </tr>
    <tr>
      <td>54</td>
      <td>Anion Gap</td>
      <td>0.006560</td>
    </tr>
    <tr>
      <td>55</td>
      <td>Heart Rate (beats/min) +++ mean 24h</td>
      <td>0.006543</td>
    </tr>
    <tr>
      <td>56</td>
      <td>Platelet +++ max 24h</td>
      <td>0.006529</td>
    </tr>
    <tr>
      <td>57</td>
      <td>BP Noninvasive Systolic (mm Hg) +++ max 24h</td>
      <td>0.006498</td>
    </tr>
    <tr>
      <td>58</td>
      <td>Heart Rate (beats/min) +++ min 24h</td>
      <td>0.006495</td>
    </tr>
    <tr>
      <td>59</td>
      <td>Platelet</td>
      <td>0.006444</td>
    </tr>
    <tr>
      <td>60</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ max 24h</td>
      <td>0.006376</td>
    </tr>
    <tr>
      <td>61</td>
      <td>Absolute Neutrophil Count</td>
      <td>0.006362</td>
    </tr>
    <tr>
      <td>62</td>
      <td>Bilirubin Indirect</td>
      <td>0.006331</td>
    </tr>
    <tr>
      <td>63</td>
      <td>Creatinine +++ RoC 24h</td>
      <td>0.006263</td>
    </tr>
    <tr>
      <td>64</td>
      <td>Glucose Level</td>
      <td>0.006194</td>
    </tr>
    <tr>
      <td>65</td>
      <td>Creatinine +++ minus_mean 24h</td>
      <td>0.006151</td>
    </tr>
    <tr>
      <td>66</td>
      <td>Respirations (breaths/min) +++ minus_mean 24h</td>
      <td>0.005874</td>
    </tr>
    <tr>
      <td>67</td>
      <td>Alanine Aminotransferase</td>
      <td>0.005746</td>
    </tr>
    <tr>
      <td>68</td>
      <td>Anion Gap +++ min 24h</td>
      <td>0.005675</td>
    </tr>
    <tr>
      <td>69</td>
      <td>Aspartate Aminotransferase</td>
      <td>0.005656</td>
    </tr>
    <tr>
      <td>70</td>
      <td>SpO2 (%) +++ RoC 24h</td>
      <td>0.005656</td>
    </tr>
    <tr>
      <td>71</td>
      <td>Creatinine +++ var 24h</td>
      <td>0.005636</td>
    </tr>
    <tr>
      <td>72</td>
      <td>BP Noninvasive Diastolic (mm Hg) +++ RoC 24h</td>
      <td>0.005572</td>
    </tr>
    <tr>
      <td>73</td>
      <td>Mean Cell Volume</td>
      <td>0.005534</td>
    </tr>
    <tr>
      <td>74</td>
      <td>Respirations (breaths/min)</td>
      <td>0.005531</td>
    </tr>
    <tr>
      <td>75</td>
      <td>Sodium Level</td>
      <td>0.005489</td>
    </tr>
    <tr>
      <td>76</td>
      <td>White Blood Cell +++ minus_mean 24h</td>
      <td>0.005482</td>
    </tr>
    <tr>
      <td>77</td>
      <td>Respirations (breaths/min) +++ var 24h</td>
      <td>0.005474</td>
    </tr>
    <tr>
      <td>78</td>
      <td>FiO2 (%)</td>
      <td>0.005463</td>
    </tr>
    <tr>
      <td>79</td>
      <td>Respirations (breaths/min) +++ mean 24h</td>
      <td>0.005384</td>
    </tr>
    <tr>
      <td>80</td>
      <td>P CO2 Venous</td>
      <td>0.005341</td>
    </tr>
    <tr>
      <td>81</td>
      <td>Prothrombin Time</td>
      <td>0.005280</td>
    </tr>
    <tr>
      <td>82</td>
      <td>White Blood Cell +++ RoC 24h</td>
      <td>0.005249</td>
    </tr>
    <tr>
      <td>83</td>
      <td>White Blood Cell +++ var 24h</td>
      <td>0.005176</td>
    </tr>
    <tr>
      <td>84</td>
      <td>Respirations (breaths/min) +++ max 24h</td>
      <td>0.005156</td>
    </tr>
    <tr>
      <td>85</td>
      <td>SpO2 (%) +++ mean 24h</td>
      <td>0.005132</td>
    </tr>
    <tr>
      <td>86</td>
      <td>Calcium Level Total</td>
      <td>0.005120</td>
    </tr>
    <tr>
      <td>87</td>
      <td>Respirations (breaths/min) +++ RoC 24h</td>
      <td>0.005078</td>
    </tr>
    <tr>
      <td>88</td>
      <td>HEIGHT_INCHES</td>
      <td>0.005034</td>
    </tr>
    <tr>
      <td>89</td>
      <td>Partial Thromboplastin Time</td>
      <td>0.004977</td>
    </tr>
    <tr>
      <td>90</td>
      <td>Platelet +++ var 24h</td>
      <td>0.004953</td>
    </tr>
    <tr>
      <td>91</td>
      <td>% Eosinophil Automated</td>
      <td>0.004844</td>
    </tr>
    <tr>
      <td>92</td>
      <td>P O2 Venous</td>
      <td>0.004791</td>
    </tr>
    <tr>
      <td>93</td>
      <td>Blood Urea Nitrogen +++ RoC 24h</td>
      <td>0.004723</td>
    </tr>
    <tr>
      <td>94</td>
      <td>Phosphorus Level</td>
      <td>0.004715</td>
    </tr>
    <tr>
      <td>95</td>
      <td>Red Blood Cell</td>
      <td>0.004709</td>
    </tr>
    <tr>
      <td>96</td>
      <td>Potassium Level</td>
      <td>0.004672</td>
    </tr>
    <tr>
      <td>97</td>
      <td>HGB HCT QC Check (Non Reportable)</td>
      <td>0.004601</td>
    </tr>
    <tr>
      <td>98</td>
      <td>Hemoglobin</td>
      <td>0.004593</td>
    </tr>
    <tr>
      <td>99</td>
      <td>Chloride</td>
      <td>0.004582</td>
    </tr>
  </tbody>
</table>


<h3>Example Alert Message</h3>
<p>73.2 year old Female admitted 2015-05-21 11:02:00 in MEDICINE</p>

<p>Latest:<br />
Temperature (degrees F): 98.1<br />
Heart Rate (beats/min): 81<br />
BP Noninvasive Systolic (mm Hg): 127<br />
BP Noninvasive Diastolic (mm Hg): 78<br />
Respirations (breaths/min): 18<br />
SpO2 (%): 96<br />
White Blood Cell: 2.1<br />
Creatinine: 1.7<br />
Anion Gap: 7<br />
Blood Urea Nitrogen: 18<br />
Platelet: 181</p>

<p>View patient Chart (UPHS wifi required): http://bit.ly/1JGOUXK<br />
Last updated at: 2015-06-10 09:24:57.558000</p>

<p>To reset the alert for this patient, respond to this message with "#reset".</p>
