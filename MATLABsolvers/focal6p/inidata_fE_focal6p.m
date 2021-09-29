function [data,fgt,Fgt,Egt] = inidata_fE_focal6p(nObs,noise)

    fgt = 1.6; % focal length
    width = 752; % sensor width
    fov = 60; % field of view
    pxl = 2*tand(fov/2)*fgt/width; % pixel's size
    Kgt = cell([1,2]);
    Kgt{1} = [fgt 0 0; 0 fgt 0; 0 0 1]; % ground truth calibration matrix
    Kgt{2} = Kgt{1};
    Zgt = [0, 0]; % radial distortion coefficients

    [Pgt,Fgt,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,nObs,noise*pxl,Zgt); % synthetic image points
    
end