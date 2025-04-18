function [C,U,dU] = coefs_satellite_triang(data)

    C = zeros(3,20);
    C([58,55,46,28,52,43,25,37,19,10,49,40,22,34,16,7,31,13,4,1]) = data{1};
    C([59,56,47,29,53,44,26,38,20,11,50,41,23,35,17,8,32,14,5,2]) = data{2};
    C([60,57,48,30,54,45,27,39,21,12,51,42,24,36,18,9,33,15,6,3]) = data{3};

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));
    
    U = @(x,y,z)[x^3,x^2*y,x*y^2,y^3,x^2*z,x*y*z,y^2*z,x*z^2,y*z^2,z^3,x^2,x*y,y^2,x*z,y*z,z^2,x,y,z,1];
    dU = @(x,y,z)[[3*x^2,2*x*y,y^2,0,2*z*x,y*z,0,z^2,0,0,2*x,y,0,z,0,0,1,0,0,0]; [0,x^2,2*x*y,3*y^2,0,z*x,2*y*z,0,z^2,0,0,x,2*y,0,z,0,0,1,0,0]; [0,0,0,0,x^2,x*y,y^2,2*z*x,2*y*z,3*z^2,0,0,0,x,y,2*z,0,0,1,0]];

end