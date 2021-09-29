function data = inidata_zF_rdist9p()
    
    Kgt = cell([1,2]);
    Kgt{1} = [rand rand rand; 0 rand rand; 0 0 1];
    Kgt{2} = [rand rand rand; 0 rand rand; 0 0 1];
    Zgt = [-0.02, -0.05]; % radial distortion coefficients

    NP = 9; % number of point correspondences
    NOISE = 0; % image noise level

    [Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

end