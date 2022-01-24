rng(23);

N = 10000;

Err_feas_relpose_6p_rad = [];

for i = 1:N

    [data,Zgt,Egt] = inidata_feas_relpose_6p_rad(6); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = nstd_39x95_colpiv_relpose_6p_rad(C); % solve polynomial system
        if isempty(ww); continue; end
        E = esse_relpose_6p_rad(ww,xx,yy,zz,M);
    catch ME
        continue;
    end

    [err,~] = rel_error(zz,Zgt(1));
    
    Err_feas_relpose_6p_rad = [Err_feas_relpose_6p_rad err];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_feas_relpose_6p_rad.mat'),'Err_feas_relpose_6p_rad');

fprintf('Problem #8. Med. error in z: %0.2e. Mean error in z: %0.2e. Number of fails: %0.2e\n',median(Err_feas_relpose_6p_rad),mean(Err_feas_relpose_6p_rad),(N-length(Err_feas_relpose_6p_rad))*100/N);



function E = esse_relpose_6p_rad(w,x,y,z,M)

    n = length(w);
    E = zeros(9,n);

    for i = 1:n
        m = [w(i); w(i)*z(i); x(i); x(i)*z(i); y(i); y(i)*z(i); z(i)^2; z(i); 1];
        ee = -M(1:5,:)*m;
        E0 = [ee(1) ee(3) x(i); ee(2) ee(4) y(i); ee(5) w(i) 1];
        E(:,i) = reshape(E0,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end