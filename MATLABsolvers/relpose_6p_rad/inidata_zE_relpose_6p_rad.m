function [data,Zgt,Egt] = inidata_zE_relpose_6p_rad(nObs,noise)
    
    width = 752; % sensor width
    fov = 60; % field of view
    pxl = 2*tand(fov/2)/width; % pixel's size
    Kgt = cell([1,2]);
    Kgt{1} = eye(3); % ground truth calibration matrix
    Kgt{2} = Kgt{1};
    Zgt = [-0.01, -0.01]; % radial distortion coefficients

    [Pgt,~,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,nObs,noise*pxl,Zgt); % synthetic image points

end