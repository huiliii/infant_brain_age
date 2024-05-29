# infant_brain_age

The codes of our paper entitiled "Brain age prediction and deviations from normative trajectories in the neonatal connectome"
<br />
1. System requirements <br />
Softwares: MATLAB_R2023a <br />
Operating System: macOS Big Sur 11.3.1

2. Installation guide <br />
MATLAB installation guide, please check https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html <br />
Typical install time for a "normal" desktop computer according to MATLAB: 30-45 mins<br />

3. Demo<br />
To run the brain_age_prediction.m on test data <br />
  a. load test_data_set.mat from ./data <br />
  b. add the function paths ./utils, ./CPM to MATLAB <br />
  c. run brain_age_prediction.m from ./main <br />
Expected output: <br />
  a. predicted ages from functional/structural connectomes <br />
  b. prediction errors of ages <br />
Expected run time: <br />
  take the test dataset with 100 subjects as an example: 0.17 sec for one round of simulation <br />

4. Instruction for use <br />
To run the code on the test data, see Demo. <br />
To reproduce the brain age prediction <br />
  a. load brain functional/strutcural connectome data from your own dataset <br />
  b. load age information for each subject <br />
  c. run brain_age_prediction.m <br />



