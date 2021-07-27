% map scene points onto image planes
function [q,Q] = synth_points(P,np,noise,la)

    w = 1; % scene width
    h = 1; % scene height
    d = 0.5; % scene depth, 0 - planar scene

    nv = size(P,2);
    q = cell([1,nv]);
    % uniformly distributed random coordinates of scene points
    Q = [w*rand(1,np)-0.5*w*ones(1,np); h*rand(1,np)-0.5*h*ones(1,np); d*rand(1,np)+ones(1,np); ones(1,np)];

    for k = 1:nv
        q{k} = P{k}*Q;
        q{k} = q{k}./(ones(3,1)*q{k}(3,:));
    end

    % add image noise
    for k = 2:nv
        q{k} = q{k} + [normrnd(zeros(2,np),noise*ones(2,np)); zeros(1,np)];
    end
    
    % add radial distortion
    for k = 1:nv
        if la(k) ~= 0; q{k} = rad_dist(q{k},np,la(k)); end
    end

end

function xr = rad_dist(xu,np,la)
    xr = ones(3,np);
    for i = 1:np
        r = la*(xu(1,i)^2+xu(2,i)^2);
        t = (1-sqrt(1-4*r))/(2*r);
        xr(1:2,i) = xu(1:2,i)*t;
        %disp(xr(1:2,i)./(1+la*(xr(1,i)^2+xr(2,i)^2)) - xu(1:2,i));
    end
end