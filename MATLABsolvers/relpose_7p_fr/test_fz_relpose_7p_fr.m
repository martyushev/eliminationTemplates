warning ('off','all');

%clear
%clc
rng(23);

N = 10000;

Err_f_relpose_7p_fr = [];
Err_z_relpose_7p_fr = [];
Err_E_relpose_7p_fr = [];

for i = 1:N

    [data,Zgt,fgt,Egt] = inidata_fz_relpose_7p_fr(0); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_relpose_7p_fr_colpiv(C); % solve polynomial system & sol(1,:) > 0
        if isempty(vv); continue; end
        ff = 1./sqrt(vv);
        E = esse_relpose_7p_fr(ff,ww,xx,yy,zz,M);
    catch ME
        continue;
    end

    [err_f,~] = rel_error(ff,fgt);
    [err_z,~] = rel_error(zz,Zgt(1));
    [err_E,~] = mat_rel_error(E,Egt{1,2});

    Err_f_relpose_7p_fr = [Err_f_relpose_7p_fr err_f];
    Err_z_relpose_7p_fr = [Err_z_relpose_7p_fr err_z];
    Err_E_relpose_7p_fr = [Err_E_relpose_7p_fr err_E];

end

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\Err_f_relpose_7p_fr.mat'),'Err_f_relpose_7p_fr');
save(strcat(folder,'\_results\Err_z_relpose_7p_fr.mat'),'Err_z_relpose_7p_fr');
save(strcat(folder,'\_results\Err_E_relpose_7p_fr.mat'),'Err_E_relpose_7p_fr');

fprintf('Problem #33. Med. error in f: %0.2e. Med. error in z: %0.2e. Med. error in E: %0.2e\n',median(Err_f_relpose_7p_fr),median(Err_z_relpose_7p_fr),median(Err_E_relpose_7p_fr));

warning ('on','all');