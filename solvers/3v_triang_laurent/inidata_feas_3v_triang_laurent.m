function [data,Xgt] = inidata_feas_3v_triang_laurent()
    
    K = cell([1,3]);
    K{1} = [1+rand rand rand; 0 1+rand rand; 0 0 1];
    K{2} = [1+rand rand rand; 0 1+rand rand; 0 0 1];
    K{3} = [1+rand rand rand; 0 1+rand rand; 0 0 1];
    Z = [0,0,0]; % radial distortion coefficients

    [P,~,~] = synth_cameras(3,K); % ground truth camera matrices
    [x,Xgt] = synth_points(P,1,Z); % synthetic image points

    h = randn(1,4);
    H = [h; -[P{1}(3,2:4); P{2}(3,2:4); P{3}(3,2:4)]\([P{1}(3,1); P{2}(3,1); P{3}(3,1)]*h-[1,0,0,0;0,1,0,0;0,0,0,1])];
    P{1} = P{1}*H;
    P{2} = P{2}*H;
    P{3} = P{3}*H;
    Xgt = H\Xgt;
    Xgt = Xgt/Xgt(4);
    
    %err = ((P{1}(1,:)*Xgt)/Xgt(1)-x{1}(1))^2+((P{1}(2,:)*Xgt)/Xgt(1)-x{1}(2))^2+...
    %        ((P{2}(1,:)*Xgt)/Xgt(2)-x{2}(1))^2+((P{2}(2,:)*Xgt)/Xgt(2)-x{2}(2))^2+...
    %        ((P{3}(1,:)*Xgt)-x{3}(1))^2+((P{3}(2,:)*Xgt)-x{3}(2))^2;
    %disp(sqrt(err));
    
    data = cell([1,6]);
    data{1} = P{1}(1:2,:);
    data{2} = P{2}(1:2,:);
    data{3} = P{3}(1:2,:);
    data{4} = x{1}(1:2);
    data{5} = x{2}(1:2);
    data{6} = x{3}(1:2);

end