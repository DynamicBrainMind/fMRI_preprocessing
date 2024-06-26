#!/bin/bash

usage() {
    echo ""
	echo "run_recon.sh <subject_name> <session_name> <bids_folder>"
	echo ""
	echo "3 inputs required: (1) bids path; (2) subject; (3) session name (required for multi-session data; otherwise leave blank)"
	echo ""
	echo "***YOU MUST HAVE FUNCTION CBIG_preproc_deoblique.sh (from CBIG package) AVAILABLE IN YOUR PATH***"
}

if [[ $# -eq 0 ]] ; then
	usage
	exit
fi

bids_path="$1"
sub="$2"
sess=${3:-1}  

# set up input/output folders
path=`echo ${bids_path%/*}`
derivs_folder=${path}/derivatives
mkdir -p ${derivs_folder}
mkdir -p ${derivs_folder}/freesurfer
mkdir -p ${derivs_folder}/${sub}

if [ $sess == 1 ]; then
	mkdir -p ${derivs_folder}/${sub}/anat
	input_path=${bids_path}/${sub}/anat
	output_path=${derivs_folder}/${sub}/anat
	anat_file=${sub}_T1w
else
	mkdir -p ${derivs_folder}/${sub}/${sess}
	mkdir -p ${derivs_folder}/${sub}/${sess}/anat
	input_path=${bids_path}/${sub}/${sess}/anat
	output_path=${derivs_folder}/${sub}/${sess}/anat
	anat_file=${sub}_${sess}_T1w
fi

# Deoblique the T1
source CBIG_preproc_deoblique.sh -i ${input_path}/${anat_file}.nii.gz -o ${output_path}/${anat_file}_deoblique.nii.gz

# Run recon-all
recon-all -s ${sub} -i ${output_path}/${anat_file}_deoblique.nii.gz -sd ${derivs_folder}/freesurfer -all -localGI