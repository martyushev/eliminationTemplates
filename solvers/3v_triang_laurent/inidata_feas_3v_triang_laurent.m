function [q,P,Qgt] = inidata_feas_3v_triang_laurent()
    
    K = cell([1,3]);
    K{1} = [randn randn randn; 0 randn randn; 0 0 1];
    K{2} = [randn randn randn; 0 randn randn; 0 0 1];
    K{3} = [randn randn randn; 0 randn randn; 0 0 1];
    Z = [0,0,0]; % radial distortion coefficients

    [P,~,~] = synth_cameras(3,K); % ground truth camera matrices
    [q,Qgt] = synth_points(P,1,Z); % synthetic image points

    h = rand(4,1);
    H = [h; -[P{1}(3,2:4); P{2}(3,2:4); P{3}(3,2:4)]\([P{1}(3,1); P{2}(3,1); P{3}(3,1)]*h-[1,0,0,0;0,1,0,0;0,0,0,1])];
    P{1} = P{1}*H;
    P{2} = P{2}*H;
    P{3} = P{3}*H;
    Qgt = H\Qgt;

end