rng(23);
N = 10000;

stats = struct('problem','3v_triang_laurent','reprerr',[],'relerr',[]);

for i = 1:N

    [data,Xgt] = inidata_feas_3v_triang_laurent(); % generate initial data

    try
        C = coefs_3v_triang_laurent(data); % compute coefficients of polynomial system
        S = red_69x127_colpiv_3v_triang_laurent(C); % solve polynomial system
        if isempty(S); continue; end
    catch ME
        continue;
    end

    [reprerr,~] = repr_error(data,S);
    [relerr,~] = rel_error(Xgt,S);
    stats.reprerr = [stats.reprerr reprerr];
    stats.relerr = [stats.relerr relerr];

end

folder = fileparts(which('add_all.m'));
save(strcat(folder,'\_results\stats_',stats.problem,'_feas.mat'),'stats');



% reprojection error
function [reprerr,X] = repr_error(data,S)
    P1 = data{1};
    P2 = data{2};
    P3 = data{3};
    x1 = data{4};
    x2 = data{5};
    x3 = data{6};
    err = zeros(size(S,2),1);
    for j = 1:size(S,2)
        X = [S(:,j); 1];
        err(j) = ((P1(1,:)*X)/X(1)-x1(1))^2+((P1(2,:)*X)/X(1)-x1(2))^2+...
            ((P2(1,:)*X)/X(2)-x2(1))^2+((P2(2,:)*X)/X(2)-x2(2))^2+...
            ((P3(1,:)*X)-x3(1))^2+((P3(2,:)*X)-x3(2))^2;
    end
    [reprerr,j] = min(sqrt(err));
    X = [S(:,j); 1];
end

% relative error
function [relerr,X] = rel_error(Xgt,S)
    err = zeros(size(S,2),1);
    for j = 1:size(S,2)
        X = [S(:,j); 1];
        err(j) = norm(X-Xgt,'fro')/norm(Xgt,'fro');
    end
    [relerr,j] = min(err);
    X = [S(:,j); 1];
end