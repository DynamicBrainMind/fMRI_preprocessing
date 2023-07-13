# fMRI_preprocessing

**Setup**
- Dataset should be organized in BIDS or BIDS-like format (e.g. dataset/subject/session/func contains all func files for a session)
- this repository should be saved a subfolder within a folder called "scripts" that is within a parent folder that also contains "dataset" as in the above example
- outputs are saved in "derivatives" folder within parent folder

**Required software**
- FSL, freesurfer, python2.7

**Running the scripts**
- **all_AROMA_preproc** runs ICA-AROMA preprocessing on one run of fMRI data for data organized in BIDS or BIDS-like format. Must "source" this from the command line.
- In iProc folder:
-    **step1_run_alignment_onesub** creates common fMRI template across all sessions/runs and registers each run to it (+performs motion correction)
-    **step2_ICA_AROMA_iProc_onesession** runs ICA-AROMA (plus regression of thresholded white matter and CSF)
-    **step3_highpass_register_onesession** runs highpass filtering and registration to MNI space, plus conversion to % signal change


