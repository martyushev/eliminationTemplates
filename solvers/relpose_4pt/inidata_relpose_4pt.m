function data = inidata_relpose_4pt()
    data = cell([1,2]);
    data{1} = [randn(2,4); ones(1,4)];
    data{2} = [randn(2,4); ones(1,4)];
    data{3} = randn;
end