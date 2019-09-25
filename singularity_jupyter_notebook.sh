user=$(whoami)

singularity exec --nv \
-B /home \
-B /om \
-B /nobackup \
-B /om2 \
-B /om2/user/msaddler/python-packages:/python-packages \
-B /om/user/msaddler/data_pitchnet:/data \
-B /om2/user/$user/pitchnet/saved_models:/saved_models \
-B /om2/user/$user/pitchnet/ibmHearingAid:/code_location \
/om2/user/msaddler/singularity-images/tfv1.13_unet.simg \
/om2/user/msaddler/jupyter_notebook_job.sh
