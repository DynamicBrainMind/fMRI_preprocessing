# fMRI_preprocessing

**Setup**

- Dataset should be organized in BIDS or BIDS-like format (e.g. dataset/subject/session/func contains all func files for a session)
- this repository should be saved a subfolder within a folder called "scripts" that is within a parent folder that also contains "dataset" as in the above example

**Required software**

FSL, freesurfer, python2.7

**Running the scripts**

all_AROMA_preproc runs ICA-AROMA preprocessing on one run of fMRI data for data organized in BIDS or BIDS-like format.


