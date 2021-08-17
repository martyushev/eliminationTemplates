function [data,Zgt,fgt,Egt] = inidata_fz_relpose_7p_fr(noise)
    
    fgt = 2.0; % focal length
    Kgt = cell([1,2]);
    Kgt{1} = [fgt 0 0; 0 fgt 0; 0 0 1]; % ground truth calibration matrix
    Kgt{2} = Kgt{1};
    Zgt = [-0.1, -0.1]; % radial distortion coefficients

    [Pgt,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,7,noise,Zgt); % synthetic image points

end