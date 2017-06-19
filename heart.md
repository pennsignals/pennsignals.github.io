---
layout: page
title: Penn Medicine Heart Failure Solution
permalink: /projects/heart/
slug: projects
---
<h3>Heart Failure solution team</h3>
<div class="team-member col s12 m8 offset-m2 l6 offset-l3">
  <div class="card-panel grey lighten-5 z-depth-1">
    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/goldberg-lee.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Lee R. Goldberg, MD, MPH</h4>
          <h5>Medical Director, University of Pennsylvania Heart Failure and Transplantation program</h5>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/jo-fante-gallager.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Jo Anne Fante-Gallagher, MHA, BSN, RN</h4>
          <h5>Director of Quality & Safety for Heart & Vascular Service Line at the University of Pennsylvania Health System</h5>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/Eugene.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Yevgeniy Gitelman, MD</h4>
          <h5>Clinical informatics manager at the center for health care innovation.</h5>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/susan.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Susan Harkness Regli, Ph.D </h4>
          <h5>Human Factors Dcientist for the University of Pennsylvania Health System.</h5>
        </div>
      </div>
    </div>

    <div class="row valign-wrapper">
      <div class="col s2">
        <img src="/assets/images/asaf-square-small.jpg" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
      </div>
      <div class="col s10">
        <div>
          <h4>Asaf Hanish</h4>
          <h5>Asaf Hanish is a Data Scientist on the Penn Medicine Predictive Healthcare team.</h5>
        </div>
      </div>
    </div>



  </div>
</div>
<h3>Heart failure continuity project</h3>

<p>The goals of this work is to set the framework for delivering reliable care and a reliable patient experience to the hf patient population at penn medicine by the elimination of unidentified heart failure inpatients, the connection and provisioning of cardiology specific care and the standardization of care to a post-acute setting.
The long-term care management of patients with a history of heart failure (hf) is a major challenge for the healthcare industry as a whole. Patients with a history of hf require coordination of care to manage their complex comorbidities, arrest disease progression and insure the highest possible quality of life. The proper coordination of care includes both the identification of at risk patients and application of a standard treatment protocol.</p>

<h3>High risk of readmission for heart failure patients</h3>
<p>The hf patient readmission risk stratification application performs a daily audit of the electronic medical record (emr).  The hf risk stratification algorithm was developed in close consultation with dr. Goldberg and jo anne fante-gallagher to assess each hf patient’s risk of returning to an emergency room (regardless of admission status) within 30 days of discharge.  The algorithm is based on the patient’s clinical, diagnostic and previously health care resources utilization pattern.</p>

<h4>Coded diagnostic history</h4>
<ul>
  <li>hx_Diag_AorticStenosis</li>
  <li>hx_Diag_COPD</li>
  <li>hx_Diag_Diabetes Mellitus</li>
  <li>hx_Diag_Drug_Alc_Dependency</li>
  <li>hx_Diag_Effects_of_CVD</li>
  <li>hx_InP_MSDRG_ACUTE MYOCARDIAL INFARCTION, DISCHARGED ALIVE</li>
  <li>hx_InP_MSDRG_CARDIAC ARRHYTHMIA AND CONDUCTION DISORDERS</li>
  <li>hx_InP_MSDRG_CIRCULATORY DISORDERED EXCEPT AMI,</li>
  <li>hx_InP_MSDRG_CRANIAL AND PERIPHERAL NERVE DISORDERS</li>
  <li>hx_InP_MSDRG_ECMO OR TRACH</li>
  <li>hx_InP_MSDRG_G.I HEMORRHAGE</li>
  <li>hx_InP_MSDRG_KIDNEY AND URINARY TRACT INFECTIONS</li>
  <li>hx_InP_MSDRG_MAJOR SMALL AND LARGE BOWEL PROCEDURES</li>
  <li>hx_InP_MSDRG_NUTRITIONAL AND MISC METABOLIC DISORDERS</li>
  <li>hx_InP_MSDRG_PULMINARY EMBOLISM</li>
  <li>hx_InP_MSDRG_RED BLOOD CELL DISORDERS</li>
</ul>

<h4>Clinical and demographic characteristics</h4>
<ul>
  <li>AGE</li>
  <li>BMI</li>
  <li>LIVING_ALONE</li>
  <li>lab_latest_Albumin Level</li>
  <li>lab_latest_Blood Urea Nitrogen</li>
  <li>lab_latest_Glucose Level</li>
  <li>lab_latest_Hemoglobin</li>
  <li>lab_latest_Sodium Level</li>
  <li>lab_slope_Sodium Level</li>
  <li>vital_latest_Heart rate (beats/min)</li>
</ul>

<h4>Health system resource utilization</h4>
<ul>
  <li>HF_PREV_VIS_COUNT</li>
  <li>Hx_OrderFnd_PTConsult</li>
  <li>IS_READMIT</li>
  <li>hx_ER_Vis_counts</li>
  <li>hx_InP_DISCH_DISP_DISCHARGE TO ANOTHER ACUTE CARE HOSPITAL</li>
  <li>hx_InP_DISCH_DISP_DISCHARGE WITH HOME HEALTH</li>
  <li>hx_InP_DISCH_DISP_LEFT AGAINST MEDICAL ADVICE</li>
  <li>hx_InP_admit_type_Elective</li>
  <li>hx_InP_service_RENAL</li>
  <li>hx_OutP_service_Anticoagulation</li>
  <li>hx_OutP_service_Family Practice</li>
  <li>hx_OutP_service_Gastroenterology</li>
  <li>hx_OutP_service_Internal Medicine</li>
  <li>hx_OutP_service_Vascular Surgery</li>
  <li>hx_last_vis_DRG_WEIGHT</li>
  <li>hx_last_vis_LOS</li>
  <li>LOCATION >>> PAH</li>
</ul>

<h3>Patient population</h3>
<h4>Heart Failure Alert Inclusion Criteria:</h4>
<p>Diagnosis of Heart Failure at a previous Inpatient or Outpatient encounter.</p>
<ul>
  <li>Age >=18 years. </li>
  <li>Assignment to a floor or unit (exclude ED/OR/Observation/RIT).</li>
  <li>Admission < 48 hours from alerting time. Urgent or Emergency admission.</li>
  <li>Under care of CVM, CSU, HSP, GER, FAM, or PUL service.</li>
  <li>Exclude transfer from outside hospital</li>
</ul>

<h3>Readmission label</h3>
<p>We trained the algorithm to detect patients with a history of Heart Failure, who return to a Penn Medicine Emergency room within 30 days of discharge. To do this, we searched all patient encounters between January 2013 and January 2015 who met the inclusion criteria (n = 9,989).</p>

<h3>Algorithm performance</h3>
<p>With over 500 patient features, a machine learning algorithm was trained using 10 fold cross validation and resulted in an AUC of 0.68 (+/- .03).  </p>

<h3>Operational metrics</h3>
<p>The high risk for readmission alert identifies about 9 at risk patients every day across the 3 downtown hospitals.  The identified patients have a readmission rate of 35%, which is about 3x higher then the non-alerted population.</p>
