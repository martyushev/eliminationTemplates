rng(23);

N = 10000;

Err_feas_relpose_6p_rad = [];

for i = 1:N

    [data,Zgt,Egt] = inidata_feas_relpose_6p_rad(6); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_6p_rad(data); % compute coefficients of polynomial system
        [ww, xx, yy, zz] = nstd_relpose_6p_rad_colpiv_sprs_39x95(C); % solve polynomial system
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