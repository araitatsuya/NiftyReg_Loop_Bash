#!/bin/bash
clear

for NUM in `seq 1 1 721`
    do
#echo $NUM-file.txt
#echo IM000${NUM}_aff.txt
        if [ "$NUM" -lt "10" ]
            then
reg_aladin -target Ref0001.nii -source IM000${NUM}.nii -rmask Mask0001.nii -aff IM000${NUM}_aff.txt
                reg_f3d -target Ref0001.nii -source IM000${NUM}.nii -rmask Mask0001.nii -aff IM000${NUM}_aff.txt -cpp IM000${NUM}_cpp.nii -result IM000${NUM}_warped.nii
                reg_transform -ref Ref0001.nii -cpp2def IM000${NUM}_cpp.nii IM000${NUM}_def.nii
        else
            if [ "$NUM" -lt "100" ]
                then
                    reg_aladin -target Ref0001.nii -source IM00${NUM}.nii -rmask Mask0001.nii -aff IM00${NUM}_aff.txt
                    reg_f3d -target Ref0001.nii -source IM00${NUM}.nii -rmask Mask0001.nii -aff IM00${NUM}_aff.txt -cpp IM00${NUM}_cpp.nii -result IM00${NUM}_warped.nii
                    reg_transform -ref Ref0001.nii -cpp2def IM00${NUM}_cpp.nii IM00${NUM}_def.nii
            else
                if [ "$NUM" -lt "1000" ]
                    then
                    reg_aladin -target Ref0001.nii -source IM0${NUM}.nii -rmask Mask0001.nii -aff IM0${NUM}_aff.txt
                    reg_f3d -target Ref0001.nii -source IM0${NUM}.nii -rmask Mask0001.nii -aff IM0${NUM}_aff.txt -cpp IM0${NUM}_cpp.nii -result IM0${NUM}_warped.nii
                    reg_transform -ref Ref0001.nii -cpp2def IM0${NUM}_cpp.nii IM0${NUM}_def.nii
                fi
            fi
        fi
    done



#REM Run NiftyReg Aladin
#reg_aladin -target !REF! -source !SOURCE!.nii -rmask !RMASK! -aff !SOURCE!_aff.txt
#REM Run NiftyReg F3D
#reg_f3d -target !REF! -source !SOURCE!.nii -rmask !RMASK! -aff !SOURCE!_aff.txt -cpp !SOURCE!_cpp.nii -result !SOURCE!_warped.nii
#REM Run NiftyReg Transform
#reg_transform -ref !REF! -cpp2def !SOURCE!_cpp.nii !SOURCE!_def.nii