% map scene points onto image planes
function [q,Q] = synth_points(P,np,z)

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
    
    % add radial distortion
    for k = 1:nv
        if z(k) ~= 0; q{k} = rad_dist(q{k},z(k)); end
    end
    
end