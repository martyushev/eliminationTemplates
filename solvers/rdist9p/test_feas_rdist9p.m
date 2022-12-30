rng(23);
N = 10000;

Err_feas_rdist9p = [];

for i = 1:N

    [data,Zgt,Fgt] = inidata_feas_rdist9p(9); % generate initial data of the problem

    try
        C = coefs_rdist9p(data); % compute coefficients of polynomial system
        S = red_73x97_colpiv_rdist9p(C); % solve polynomial system
        if isempty(S); continue; end
        ww = S(1,:);
        xx = S(2,:);
        yy = S(3,:);
        zz = S(4,:);
    catch ME
        continue;
    end

    [err,~] = rel_error(zz,Zgt(1));
    %[err,~] = rel_error(ww,Zgt(2));
    
    Err_feas_rdist9p = [Err_feas_rdist9p err];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\Err_feas_rdist9p.mat'),'Err_feas_rdist9p');

fprintf('Problem #9. Med. error in z: %0.2e. Mean error in z: %0.2e. Number of fails: %0.2e\n',median(Err_feas_rdist9p),mean(Err_feas_rdist9p),(N-length(Err_feas_rdist9p))*100/N);