rng(23);

N = 10000;

Err_fl_relpose_7p_fr = [];
Err_z_relpose_7p_fr = [];
Err_F_relpose_7p_fr = [];

for i = 1:N

    [data,fgt,Zgt,Fgt,Egt] = inidata_feas_relpose_7p_fr(7); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_relpose_7p_fr_colpiv_sprs(C); % solve polynomial system I = find(not(imag( sol(1,:) )) & sol(1,:) > 0 & sol(5,:) >= -1 & sol(5,:) <= 1);
        if isempty(vv); continue; end
        ff = 1./sqrt(vv);
        [F,E] = esse_relpose_7p_fr(ff,ww,xx,yy,zz,M);
    catch ME
        continue;
    end

    [err_fl,~] = rel_error(ff,fgt);
    [err_z,~] = rel_error(zz,Zgt(1));
    [err_F,~] = mat_rel_error(F,Fgt{1,2});

    Err_fl_relpose_7p_fr = [Err_fl_relpose_7p_fr err_fl];
    Err_z_relpose_7p_fr = [Err_z_relpose_7p_fr err_z];
    Err_F_relpose_7p_fr = [Err_F_relpose_7p_fr err_F];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_fl_relpose_7p_fr.mat'),'Err_fl_relpose_7p_fr');
save(strcat(folder,'\_results\Err_z_relpose_7p_fr.mat'),'Err_z_relpose_7p_fr');
save(strcat(folder,'\_results\Err_F_relpose_7p_fr.mat'),'Err_F_relpose_7p_fr');

fprintf('Problem #33. Med. error in f: %0.2e. Med. error in z: %0.2e. Med. error in F: %0.2e\n',median(Err_fl_relpose_7p_fr),median(Err_z_relpose_7p_fr),median(Err_F_relpose_7p_fr));



function [F,E] = esse_relpose_7p_fr(f,w,x,y,z,M)

    n = length(f);
    F = zeros(9,n);
    E = zeros(9,n);

    for i = 1:n
        m = [w(i); w(i)*z(i); x(i); x(i)*z(i); y(i); y(i)*z(i); z(i); 1];
        ff = -M(1:5,:)*m;
        F0 = [ff(1) ff(3) x(i); ff(2) ff(4) y(i); ff(5) w(i) 1];
        F(:,i) = reshape(F0,9,1);
        F(:,i) = F(:,i)/norm(F(:,i),'fro');
        K = diag([f(i) f(i) 1]);
        E0 = K.'*F0*K;
        E(:,i) = reshape(E0,9,1);
        E(:,i) = E(:,i)/norm(E(:,i),'fro');
    end

end