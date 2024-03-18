# fMRI_preprocessing

**Overview**
- These scripts perform preprocessing of fMRI data (task or rest), including head motion correction, registration (to anatomical and MNI standard space),  [ICA-AROMA](https://www.sciencedirect.com/science/article/abs/pii/S1053811915001822), regression of eroded white matter and cerebrospinal fluid signals, highpass (0.01 Hz) cutoff filtering, bandpass (0.01 - 0.1 Hz) filtering (e.g. for resting state fMRI), and conversion to % signal change. The pipeline can be run in the standard way on one run at a time using the all_AROMA_preproc function, or it can be used with code more optimized for individual subjects who have multiple sessions (see below).

**Setup**
- Dataset should be organized in BIDS or BIDS-like format (e.g. dataset/subject/session/func contains all func files for a session)
- After cloning this repository, add the path to your bash startup script (.bash_profile on Mac or .bashrc on Linux), e.g. by adding these 2 lines (using your own path) to the script:
  
PATH="/Users/ak4379/Documents/project/scripts/fMRI_preprocessing:${PATH}"
PATH="/Users/ak4379/Documents/project/scripts/fMRI_preprocessing/iProc:${PATH}"

- After adding those lines to your bash startup, test setup by opening a terminal and typing "all_AROMA_preproc_singleSess" which you should output instructions for this function

**Required software**
- Required: [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation) and python2.7 (+numpy)
- You must have one of the following installed: [AFNI](https://afni.nimh.nih.gov/) or [niimath](https://github.com/rordenlab/niimath)
- Note: AFNI or niimath are used for bandpass temporal filtering; functions labeled with suffix "_niimath" use niimath without need to install AFNI
- Ntoe: If you have multiple versions of python installed, you can install numpy for version 2.7 by typing "python2.7 -m pip install numpy" in terminal
	
**Running the scripts**
- **all_AROMA_preproc_singleSess** runs ICA-AROMA preprocessing on one run of fMRI data for data organized in BIDS or BIDS-like format (for subjects who have just one session in the BIDS folder).
- In iProc folder, there are scripts for more optimal processing of individual subjects with multiple sessions:
-    **step1_run_alignment_onesub** creates common fMRI template across all sessions/runs and registers each run to it (+performs motion correction)
-    **step2_ICA_AROMA_iProc_onesession** runs ICA-AROMA (plus regression of thresholded white matter and CSF)
-    **step3_highpass_register_onesession** runs highpass filtering (0.01 Hz cutoff), bandpass (0.01 - 0.1 Hz) filtering, and registration to MNI space, plus conversion to % signal change (for high-pass filtered data)


