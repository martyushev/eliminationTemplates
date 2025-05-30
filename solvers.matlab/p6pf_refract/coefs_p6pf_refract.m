function [C,U,dU] = coefs_p6pf_refract(data)

    x = data{1};
    X = data{2};

    M = [2*x(3,:); -x(2,:); 2*x(1,:); 2*X(2,:).*x(3,:); -2*X(1,:).*x(3,:);...
        X(1,:).*x(2,:)+X(2,:).*x(1,:); -2*x(3,:); x(2,:); -x(2,:); 2*x(1,:);...
        x(2,:); -2*x(3,:); -2*x(3,:); -x(1,:); -2*x(2,:); x(1,:); x(1,:); 2*x(2,:);...
        -x(1,:); 2*X(1,:).*x(3,:); 2*X(2,:).*x(3,:); -X(1,:).*x(2,:)-X(2,:).*x(1,:);...
        -2*(X(1,:).*x(1,:)-X(2,:).*x(2,:)); X(1,:).*x(2,:)-X(2,:).*x(1,:);...
        -2*(X(1,:).*x(1,:)+X(2,:).*x(2,:)); -X(1,:).*x(2,:)+X(2,:).*x(1,:)]';

    M = M(:,1:6)\M(:,1:end);

    C = zeros(4,27);

    C(1) = -2*M(135);
    C([5,17]) = M(134);
    C([9,85]) = -2*M(141);
    C(13) = M(140);
    C([21,29]) = M(133);
    C(25) = 2*M(135);
    C(33) = M(140)-2*M(147);
    C([37,49,105]) = -M(151);
    C(41) = M(146)+2*M(141);
    C([45,89]) = -M(133);
    C([53,81,93]) = M(151);
    C(57) = M(146)+2*M(141);
    C([61,69]) = M(145);
    C(65) = -M(140)+2*M(147);
    C([73,101]) = -M(145);
    C(77) = -M(140);
    C([58,67,84,86]) = 1;
    C(90) = M(136);
    C(98) = M(142);
    C(102) = M(148);
    C(106) = -M(142);
    C([79,96]) = -1;
    C(91) = M(137);
    C(99) = -M(155);
    C(103) = M(149);
    C(107) = M(155);
    C(92) = M(138);
    C(100) = -M(156);
    C(104) = M(150);
    C(108) = M(156);

    C = C./repmat(sqrt(sum(C.*conj(C),2)),1,size(C,2));

    U = @(w,x,y,z)[w*x^2*y*z,w*x*y^2*z,w*x*z^3,z^3*y*w,w*x^2*y,x^3*y,w*x*y^2,y^3*x,w*x*z^2,z^2*x^2,z^2*y*w,x*z^2*y,z^2*y^2,z^4,w*x*z,z*x^2,w*y*z,z*y^2,z^3,x*w,x^2,y*w,x*y,y^2,z^2,z,1];
    dU = @(w,x,y,z)[[x^2*y*z,y^2*x*z,z^3*x,z^3*y,x^2*y,0,x*y^2,0,x*z^2,0,y*z^2,0,0,0,z*x,0,y*z,0,0,x,0,y,0,0,0,0,0];[2*w*x*y*z,w*y^2*z,w*z^3,0,2*w*x*y,3*x^2*y,w*y^2,y^3,w*z^2,2*x*z^2,0,y*z^2,0,0,w*z,2*z*x,0,0,0,w,2*x,0,y,0,0,0,0];[w*x^2*z,2*w*x*y*z,0,w*z^3,w*x^2,x^3,2*w*x*y,3*x*y^2,0,0,w*z^2,x*z^2,2*y*z^2,0,0,0,w*z,2*y*z,0,0,0,w,x,2*y,0,0,0];[w*x^2*y,w*x*y^2,3*w*x*z^2,3*z^2*y*w,0,0,0,0,2*w*x*z,2*x^2*z,2*w*y*z,2*x*y*z,2*y^2*z,4*z^3,x*w,x^2,y*w,y^2,3*z^2,0,0,0,0,0,2*z,1,0]];

end