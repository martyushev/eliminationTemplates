
[data,Xgt] = inidata_feas_3v_triang_laurent(); % generate initial data

C = coefs_3v_triang_laurent(data); % compute coefficients of polynomial system
S = red_69x127_colpiv_3v_triang_laurent(C); % solve polynomial system

min_err = inf;
ind = 0;
for i = 1:size(S,2)
    Xi = [S(:,i); 1];
    x1 = [data{1}; 1 0 0 0]*Xi;
    x2 = [data{2}; 0 1 0 0]*Xi;
    x3 = [data{3}; 0 0 0 1]*Xi;
    err = sum((x1(1:2)/x1(3)-data{4}).^2 + (x2(1:2)/x2(3)-data{5}).^2 + (x3(1:2)/x3(3)-data{6}).^2);
    if err<min_err
        min_err = err;
        ind = i;
    end
end

X = S(1:3,ind);
norm(X-Xgt,'fro')