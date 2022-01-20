rng(23);

N = 10000;

Err_feas_focal6p_1s = [];

for i = 1:N

    [data,fgt,Fgt,Egt] = inidata_feas_focal6p_1s(6); % generate initial data of the problem

    try
        [C,M] = coefs_focal6p_1s(data); % compute coefficients of polynomial system
        [gg,uu,vv] = std_focal6p_1s_colpiv_sprs(C); % solve polynomial system
        if isempty(gg); continue; end
        ff = 1./sqrt(gg);
        [F,E] = esse_focal6p_1s(ff,uu,vv,M);
    catch ME
        continue;
    end

    [err,~] = rel_error(ff,fgt);
    
    Err_feas_focal6p_1s = [Err_feas_focal6p_1s err];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_feas_focal6p_1s.mat'),'Err_feas_focal6p_1s');

fprintf('Problem #2. Med. error in f: %0.2e. Mean error in f: %0.2e. Number of fails: %0.2e\n',median(Err_feas_focal6p_1s),mean(Err_feas_focal6p_1s),(N-length(Err_feas_focal6p_1s))*100/N);