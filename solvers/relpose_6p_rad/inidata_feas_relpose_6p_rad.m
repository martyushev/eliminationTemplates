function [data,Zgt,Egt] = inidata_feas_relpose_6p_rad(nObs)
    
    Kgt = cell([1,2]);
    Kgt{1} = eye(3); % ground truth calibration matrix
    Kgt{2} = Kgt{1};
    Zgt = [-0.5,-0.5]; % radial distortion coefficients

    [Pgt,~,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,nObs,Zgt); % synthetic image points

end