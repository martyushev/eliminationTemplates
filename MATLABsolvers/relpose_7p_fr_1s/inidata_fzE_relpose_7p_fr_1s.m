function data = inidata_relpose_7p_fr_1s()

    %FPXL = 1.6; % focal length
    %Kgt = cell([1,2]);
    %Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
    %Kgt{2} = Kgt{1};
    %Zgt = [-0.05, -0.05]; % radial distortion coefficients

    %NP = 7; % number of point correspondences
    %NOISE = 0; % image noise level

    %[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
    %[q,~] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

    data = cell([1,2]);
    data{1} = rand(2,7);
    data{2} = rand(2,7);
end