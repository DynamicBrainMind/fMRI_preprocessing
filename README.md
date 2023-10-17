# fMRI_preprocessing

**Overview**
- These scripts perform preprocessing of fMRI data (task or rest), including head motion correction, registration (to anatomical and MNI standard space),  [ICA-AROMA](https://www.sciencedirect.com/science/article/abs/pii/S1053811915001822), regression of eroded white matter and cerebrospinal fluid signals, highpass (0.01 Hz) cutoff filtering, bandpass (0.01 - 0.1 Hz) filtering (e.g. for resting state fMRI), and conversion to % signal change. The pipeline can be run in the standard way on one run at a time using the all_AROMA_preproc function, or it can be used with code more optimized for individual subjects who have multiple sessions (see below).

**Setup**
- Dataset should be organized in BIDS or BIDS-like format (e.g. dataset/subject/session/func contains all func files for a session)
- this repository should be saved a subfolder within a folder called "scripts" that is within a parent folder that also contains "dataset" as in the above example
- outputs are saved in "derivatives" folder within parent folder

**Required software**
- [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation), freesurfer, python2.7 (+numpy), AFNI

**Running the scripts**
- **all_AROMA_preproc** runs ICA-AROMA preprocessing on one run of fMRI data for data organized in BIDS or BIDS-like format. Must "source" this from the command line.
- In iProc folder, there are scripts for more optimal processing of individual subjects with multiple sessions:
-    **step1_run_alignment_onesub** creates common fMRI template across all sessions/runs and registers each run to it (+performs motion correction)
-    **step2_ICA_AROMA_iProc_onesession** runs ICA-AROMA (plus regression of thresholded white matter and CSF)
-    **step3_highpass_register_onesession** runs highpass filtering (0.01 Hz cutoff), bandpass (0.01 - 0.1 Hz) filtering, and registration to MNI space, plus conversion to % signal change (for high-pass filtered data)


