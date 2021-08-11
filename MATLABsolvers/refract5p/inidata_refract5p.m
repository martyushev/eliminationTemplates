function data = inidata_refract5p()
    data = cell([1,2]);
    %Kgt = cell([1,2]);
    %Kgt{1} = [1 0 0; 0 1 0; 0 0 1]; % ground truth calibration matrix
    %Kgt{2} = Kgt{1};
    %Zgt = [0, 0]; % radial distortion coefficients

    %NP = 5; % number of point correspondences
    %NOISE = 0; % image noise level

    %[Pgt,~] = synth_cameras(2,Kgt); % ground truth camera matrices
    %[q,Q] = synth_points(Pgt,NP,NOISE,Zgt); % synthetic image points
    data{1} = rand(3,5);
    data{2} = rand(3,5);
end