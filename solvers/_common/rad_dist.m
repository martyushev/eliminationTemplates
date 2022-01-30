% radial distortion
function xd = rad_dist(xu,z)
    xd = xu;
    for i = 1:size(xu,2)
        r = 2*z*(xu(1,i)^2+xu(2,i)^2);
        t = (1-sqrt(1-2*r))/r;
        xd(1:2,i) = xu(1:2,i)*t;
        %disp(xd(1:2,i)./(1+z*(xd(1,i)^2+xd(2,i)^2)) - xu(1:2,i));
    end
end