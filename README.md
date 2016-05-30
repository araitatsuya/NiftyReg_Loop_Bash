# NiftyReg_Loop_Bash
Running NiftyReg in for-loop in MacOS/Unix environment using BASH script.

# Download NiftyRef
NiftyReg 1.3.9 (as of May 2016)
https://sourceforge.net/projects/niftyreg/

# Install NiftyReg
http://sourceforge.mirrorservice.org/n/ni/niftyreg/install_NiftyReg_macLinux.pdf

Overall, the instruction is fairly accurate. Except, the project will be installed into Library(?) but not into the folder mentioned by the instruction. 
Based on my experience, CMAKE 2.8.5 worked on both OSX9 and OSX11. (CMAKE 2.8.5 is GUI based). After 'generate', '$make' and '$make install' will be excuted in Terminal/Command Window. 
The newer version of CMAKE (such as 3.2) did not work. 

CMAKE version 2.8
https://cmake.org/files/v2.8/

# My favorite work flow using MATLAB
                Image file -> MATLAB file -> Nifty file -> NiftyReg -> Nifty file -> MATLAB file

NIfTI_20140122 (as of May 2016): Nifty Image Tool on MATLAB

http://www.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image

by Jimmy Shen

23 Oct 2005 (Updated 22 Jan 2014)

http://www.mathworks.com/matlabcentral/profile/authors/757722-jimmy-shen

1. MATLAB to Nii (2D)

    %% Input %%
    
    % IM: image data
    
    % filename: file name
    
    % Ref: reference/target image data
    
    % Mask: Mask data on reference/target image

    save_nii(IM, [filename '.nii']) % IM.nii
    
    save_nii(Ref, 'Ref.nii') $Ref.nii
    
    imagesc(Ref);
    
    [Mask, x_ref_mask, y_ref_mask] = roipoly;
    
    save_nii(Mask, 'Mask.nii') $Mask.nii
    
2. Nii to MATLAB (Stack of 2D images)

    %% Input %%

    % i1: image ID number
    
    % x_ref, y_ref: points[x,y] on the reference image
    
    % Deformed Coordinate System: IM_def.nii
    
    % Warped Image: IM_warped.nii

    %% Deformed Coordinate System %%
    
    Def_nii = load_nii('IM_def.nii');
    
    Y_def = Def_nii.img(:,:,1,1,1);
    
    X_def = Def_nii.img(:,:,1,1,2);
    
    %% Reference Coordinate System %%
    
    [X_ref,Y_ref] = meshgrid([1:size(X_def,2)], [1:size(X_def,1)]);
    
    %% Point by Point Transformation %%
    
    x_def(:,i1) = interp2(X_ref,Y_ref,X_def,x_ref,y_ref);
    
    y_def(:,i1) = interp2(X_ref,Y_ref,Y_def,x_ref,y_ref);
    
    %% Warped Image %%
    
    Warped_nii = load_nii('IM_warped.nii');
    
    Warped_IM = Warped_nii.img;

# Use NiftyReg_Loop.sh

There are XXX source/moving 2D images to be registered onto the reference/target 2D image around the specific area specified by a mask.   

  %% Modify the number of loops using text editor %%
  
  e.g. 1 to 721
  
                  for NUM in `seq 1 1 721`

  %% Run NiftyReg_Loop.sh in Terminal/Command Window
  
                  bash NiftyReg_Loop.sh

  %% Input files (in the same folder) %%
  
  Target Image: Ref0001.nii
  
  Source Images: IM0001.nii to IM0XXX.nii
  
  Mark: Mask0001.nii (0 and 1 on Ref0001.nii)
  
  %% Output files %%
  
  Affine Transformation: IM0XXX_aff.txt.
    Quick and dirty affine transformation (principal stretch, translation, shear, and rotation) with no deformable local control.
    
  Warped Images: IM0XXX_warped.nii.
    Warped source images; Target Image ~ Warped Image (Hopefully)
    
  Deformed Coordinate System: IM0XXX_def.nii
  
  CPP file: IM0XXX_cpp.nii
  
# About NiftyReg
Personally, my favorite deformable image registration software developed by a group of scientists at University College London, United Kingdom. 

https://sourceforge.net/projects/niftyreg/

# Reference
---------
LICENSE
---------
Copyright (c) 2009, University College London, United-Kingdom. All rights reserved.

---------
CONTACT
---------
For any comment, please, feel free to contact Marc Modat (m.modat@ucl.ac.uk).
https://sourceforge.net/p/niftyreg/git/ci/master/tree/

      May 29th 2016
          Tatsuya J. Arai 
    





