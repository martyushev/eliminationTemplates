function data = inidata_num_gen_relpose_scale()

    data = cell([1,4]);
    data{1} = randn(3,7);
    data{2} = randn(3,7);
    data{3} = randn(3,7);
    data{4} = randn(3,7);
    for i = 1:7
        data{1}(:,i) = data{1}(:,i)/norm(data{1}(:,i),'fro');
        data{2}(:,i) = data{2}(:,i)/norm(data{2}(:,i),'fro');
        data{3}(:,i) = skew(data{1}(:,i))*data{3}(:,i);
        data{4}(:,i) = skew(data{2}(:,i))*data{4}(:,i);
    end
    
end