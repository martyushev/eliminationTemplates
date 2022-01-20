function [data,Zgt,Fgt] = inidata_feas_rdist9p(nObs)
    
    Kgt = cell([1,2]);
    Kgt{1} = [randn randn randn; 0 randn randn; 0 0 1];
    Kgt{2} = [randn randn randn; 0 randn randn; 0 0 1];
    Zgt = [-0.4,-0.8]; % radial distortion coefficients

    [Pgt,Fgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,nObs,Zgt); % synthetic image points

end