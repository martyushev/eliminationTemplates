rng(23);
N = 10000;

Err_feas_relpose_7p_fr_1s = [];

for i = 1:N

    [data,fgt,Zgt,Fgt,Egt] = inidata_feas_relpose_7p_fr_1s(7); % generate initial data of the problem

    try
        [C,M] = coefs_relpose_7p_fr_1s(data); % compute coefficients of polynomial system
        [xx,yy,zz] = std_55x74_colpiv_relpose_7p_fr_1s(C); % solve polynomial system
        if isempty(xx); continue; end
        ww = arrayfun(@(j) get_w(C,xx(j),yy(j),zz(j)), 1:length(xx));
        I = find(ww > 0);
        xx = xx(I);
        yy = yy(I);
        zz = zz(I);
        ww = ww(I);
        if isempty(ww); continue; end
        %ff = 1./sqrt(ww);
    catch ME
        continue;
    end

    [err,~] = rel_error(zz,Zgt(1));

    Err_feas_relpose_7p_fr_1s = [Err_feas_relpose_7p_fr_1s err];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_feas_relpose_7p_fr_1s.mat'),'Err_feas_relpose_7p_fr_1s');

fprintf('Problem #10. Med. error in z: %0.2e. Mean error in z: %0.2e. Number of fails: %0.2e\n',median(Err_feas_relpose_7p_fr_1s),mean(Err_feas_relpose_7p_fr_1s),(N-length(Err_feas_relpose_7p_fr_1s))*100/N);