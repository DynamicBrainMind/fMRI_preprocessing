# fMRI_preprocessing

**Overview**
- These scripts perform preprocessing of fMRI data (task or rest), including head motion correction, registration (to anatomical and MNI standard space),  [ICA-AROMA](https://www.sciencedirect.com/science/article/abs/pii/S1053811915001822), regression of eroded white matter and cerebrospinal fluid signals, highpass (0.01 Hz) cutoff filtering, bandpass (0.01 - 0.1 Hz) filtering (e.g. for resting state fMRI), and conversion to % signal change. The pipeline can be run in the standard way on one run at a time using the all_AROMA_preproc function, or it can be used with code more optimized for individual subjects who have multiple sessions (see below).

**Setup**
- Dataset should be organized in BIDS or BIDS-like format (e.g. dataset/subject/session/func contains all func files for a session)
- After cloning this repository, add the path to your bash startup script (.bash_profile on Mac or .bashrc on Linux), e.g. by adding these 2 lines (using your own path) to the script:
  
PATH="/Users/ak4379/Documents/project/scripts/fMRI_preprocessing:${PATH}"
PATH="/Users/ak4379/Documents/project/scripts/fMRI_preprocessing/iProc:${PATH}"

- After adding those lines to your bash startup, test setup by opening a terminal and typing "all_AROMA_preproc" which you should output instructions for this function

**Required software**
- Required: [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation), python3, and [niimath](https://github.com/rordenlab/niimath)
- A few python3 packages are needed, which can be found in requirements.txt file in ICA-AROMA directory. Type "pip install -r requirements.txt" in terminal to install.
	
**Running the scripts**
- **all_AROMA_preproc** is the main function that runs ICA-AROMA preprocessing on fMRI data in BIDS or BIDS-like format.
- **all_AROMA_preproc_OppPhaseB0** includes field map correction step when opposite-phase B0 images are available. This requires an acq_params.txt file as additional input; see [here](https://web.mit.edu/fsl_v5.0.10/fsl/doc/wiki/topup(2f)TopupUsersGuide.html) for more details.


