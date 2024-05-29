# infant_brain_age

The codes of our paper entitiled "Brain age prediction and deviations from normative trajectories in the neonatal connectome"
<br />
1. System requirements
Softwares: MATLAB_R2023a
Operating System: macOS Big Sur 11.3.1

2. Installation guide
MATLAB installation guide, please check https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html
Typical install time for a "normal" desktop computer according to MATLAB: 30-45 mins

3. Demo
To run the brain_age_prediction.m on test data
  a. load test_data_set.mat from ./data
  b. add the function paths ./utils, ./CPM to MATLAB
  c. run brain_age_prediction.m from ./main
Expected output:
  a. predicted ages from functional/structural connectomes
  b. prediction errors of ages
Expected run time:
  take the test dataset with 100 subjects as an example: 0.17 sec for one round of simulation 

4. Instruction for use
To run the code on the test data, see Demo.
To reproduce the brain age prediction
  a. load brain functional/strutcural connectome data from your own dataset
  b. load age information for each subject
  c. run brain_age_prediction.m



