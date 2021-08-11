function data = inidata_p6pf_refract()

    %FPXL = 1.6; % focal length
    %Kgt = cell([1,2]);
    %Kgt{1} = [FPXL 0 0; 0 FPXL 0; 0 0 1]; % ground truth calibration matrix
    %Kgt{2} = Kgt{1};
    %Zgt = [0, 0]; % radial distortion coefficients

    %NP = 6; % number of point correspondences
    %NOISE = 0; % image noise level

    %[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
    %[q,Q] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points

    data = cell([1,2]);
    data{1} = rand(3,6);
    data{2} = rand(3,6);
    
end