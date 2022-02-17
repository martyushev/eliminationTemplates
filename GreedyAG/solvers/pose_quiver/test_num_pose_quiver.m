rng(23);

N = 10000;

Err_pose_quiver = [];
Tm_pose_quiver = [];

for i = 1:N

    data = inidata_pose_quiver(); % generate initial data of the problem

    try
        tic;
        C = coefs_pose_quiver(data); % compute coefficients of polynomial system
        [ww,xx,yy,zz] = std_65x85_colpiv_pose_quiver(C); % solve polynomial system
        tm = toc;
        if isempty(ww); continue; end
    catch ME
        continue;
    end

    M = [];
    for j=1:length(ww)
        w = ww(j);
        x = xx(j);
        y = yy(j);
        z = zz(j);
        m = [x^2*w,y^2*w,z*x*w,z*y*w,z^2*w,w*x,x^2,w*y,x*y,y^2,z*x,z*y,z^2,w,x,y,z,1];
        m = m/norm(m,'fro');
        M = [M; norm(C*m.','fro')];
    end
    M = sort(M);
    err = norm(M(1:min(20,length(M))),'fro');

    Err_pose_quiver = [Err_pose_quiver err];
    Tm_pose_quiver = [Tm_pose_quiver tm];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_pose_quiver.mat'),'Err_pose_quiver');

fprintf('Problem: pose_quiver. Ave. runtime: %0.1f ms. Med. error: %0.2e\n',10^3*mean(Tm_pose_quiver),median(Err_pose_quiver));
