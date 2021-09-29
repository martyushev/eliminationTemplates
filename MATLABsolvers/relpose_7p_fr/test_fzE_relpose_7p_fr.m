warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err_fl_relpose_7p_fr = [];
Err_z_relpose_7p_fr = [];
Err_F_relpose_7p_fr = [];

for i = 1:N

    [data,fgt,Zgt,Fgt,Egt] = inidata_fzE_relpose_7p_fr(7,0); % generate initial data of the problem

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

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_fl_relpose_7p_fr_c.mat'),'Err_fl_relpose_7p_fr');
save(strcat(folder,'\_results\Err_z_relpose_7p_fr_c.mat'),'Err_z_relpose_7p_fr');
save(strcat(folder,'\_results\Err_F_relpose_7p_fr_c.mat'),'Err_F_relpose_7p_fr');

fprintf('Problem #33. Med. error in f: %0.2e. Med. error in z: %0.2e. Med. error in F: %0.2e\n',median(Err_fl_relpose_7p_fr),median(Err_z_relpose_7p_fr),median(Err_F_relpose_7p_fr));

warning ('on','all');