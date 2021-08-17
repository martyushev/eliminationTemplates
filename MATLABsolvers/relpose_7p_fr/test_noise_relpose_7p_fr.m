warning ('off','all');

%clear
%clc
rng(23);

N = 1000;

q1_f_relpose_7p_fr = [];
q1_z_relpose_7p_fr = [];
q1_E_relpose_7p_fr = [];

lev = 0:0.01:0.1;

for j = lev

Err_f = [];
Err_z = [];
Err_E = [];

for i = 1:N

    [data,Zgt,fgt,Egt] = inidata_fz_relpose_7p_fr(j); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_7p_fr(data); % compute coefficients of polynomial system
        [vv, ww, xx, yy, zz] = std_relpose_7p_fr_colpiv(C); % solve polynomial system
        if isempty(vv); continue; end
        ff = 1./sqrt(vv);
        E = esse_relpose_7p_fr(ff,ww,xx,yy,zz,M);
    catch ME
        continue;
    end

    [err_f,~] = rel_error(ff,fgt);
    [err_z,~] = rel_error(zz,Zgt(1));
    [err_E,~] = mat_rel_error(E,Egt{1,2});

    Err_f = [Err_f err_f];
    Err_z = [Err_z err_z];
    Err_E = [Err_E err_E];

end

q1_f_relpose_7p_fr = [q1_f_relpose_7p_fr quantile(Err_f,0.25)];
q1_z_relpose_7p_fr = [q1_z_relpose_7p_fr quantile(Err_z,0.25)];
q1_E_relpose_7p_fr = [q1_E_relpose_7p_fr quantile(Err_E,0.25)];

end

folder = fileparts(which('test_num_all.m'));
save(strcat(folder,'\_results\q1_f_relpose_7p_fr.mat'),'q1_f_relpose_7p_fr');
save(strcat(folder,'\_results\q1_z_relpose_7p_fr.mat'),'q1_z_relpose_7p_fr');
save(strcat(folder,'\_results\q1_E_relpose_7p_fr.mat'),'q1_E_relpose_7p_fr');

disp(q1_f_relpose_7p_fr);
disp(q1_z_relpose_7p_fr);
disp(q1_E_relpose_7p_fr);

warning ('on','all');