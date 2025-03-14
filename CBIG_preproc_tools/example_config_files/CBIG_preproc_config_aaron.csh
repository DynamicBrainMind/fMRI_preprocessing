#! /bin/csh
#

# DO NOT CHANGE: This clears old freesurfer variables if they previously exists
if( $?FREESURFER_HOME ) then
	source $FREESURFER_HOME/bin/clear_fs_env.csh 
endif

# PLEASE CHANGE: Please specify location of CBIG repository
setenv CBIG_CODE_DIR /Users/ak4379/Documents/scripts/CBIGs

# PLEASE CHANGE: define locations for these libraries
setenv FREESURFER_HOME /Applications/freesurfer/7.4.1
setenv CBIG_MATLAB_DIR /Applications/MATLAB_R2020b.app
setenv CBIG_SPM_DIR    /Users/ak4379/Documents/MATLAB/spm12
setenv CBIG_AFNI_DIR   /Users/ak4379/abin
setenv CBIG_ANTS_DIR   /Users/ak4379/ANTs/bin/
setenv CBIG_WB_DIR     /Applications/workbench
setenv CBIG_FSLDIR     /usr/local/fsl
setenv SUBJECTS_DIR	/Users/ak4379/Documents/data/R21-rt-fMRI/derivatives/freesurfer

# DO NOT CHANGE: set up your environment with the configurations above
#set SETUP_PATH = $CBIG_CODE_DIR/setup/CBIG_generic_setup.csh
set SETUP_PATH = /Users/ak4379/Documents/data/R21_EEG-fMRI/scripts/CBIG_generic_setup.csh
source $SETUP_PATH

# DO NOT CHANGE: set up temporary directory for MRIread from FS6.0 for CBIG
# members using the HPC. Other users should comment this out.
#setenv TMPDIR /tmpstore

# Do NOT CHANGE: set up MATLABPATH so that MATLAB can find startup.m in our repo 
#setenv MATLABPATH = $CBIG_CODE_DIR/setup
setenv MATLABPATH $CBIG_CODE_DIR/setup
#setenv MATLABPATH = /cluster/evegroup/Aaron/scripts/CBIG/setup

# specified the default Python environment.
# Please UNCOMMENT if you follow CBIG's set up for Python environments.
# We use Python version 3.5 as default.
# Please see $CBIG_CODE_DIR/setup/python_env_setup/README.md for more details.
# source activate CBIG_py3
