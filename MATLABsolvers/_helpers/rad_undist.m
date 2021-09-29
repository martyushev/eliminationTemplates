function xu = rad_undist(xd,z)
    xu = xd;
    for i = 1:size(xd,2) 
        xu(1:2,i) = xd(1:2,i)./(1+z*(xd(1,i)^2+xd(2,i)^2));
    end
end