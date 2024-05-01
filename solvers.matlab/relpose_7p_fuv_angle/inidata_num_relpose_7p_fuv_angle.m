function data = inidata_num_relpose_7p_fuv_angle()

    data = cell([1,2]);
    data{1} = randn(3,2);
    data{1} = [data{1} data{1}(:,1)*randn+data{1}(:,2)*randn];
    data{2} = randn;

end