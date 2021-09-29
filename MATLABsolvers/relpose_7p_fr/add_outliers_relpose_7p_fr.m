function data = add_outliers_relpose_7p_fr(data,outlr_frac)

    x1 = data{1};
    x2 = data{2};
    nobs = size(x1,2);
    noutlr = round(nobs*outlr_frac);
    
    x1o = [2*rand(2,noutlr)-1; ones(1,noutlr)];
    x2o = [2*rand(2,noutlr)-1; ones(1,noutlr)];
    x1 = [x1(:,1:nobs-noutlr) x1o];
    x2 = [x2(:,1:nobs-noutlr) x2o];
    % reorder observations
    indx = randperm(nobs);
    data = {x1(:,indx),x2(:,indx)};

end