function data = inidata_gen6p()
    data = cell([1,4]);
    data{1} = randn(3,6);
    data{2} = randn(3,6);
    data{3} = randn(3,6);
    data{4} = randn(3,6);
    for i = 1:6
        data{1}(:,i) = data{1}(:,i)/norm(data{1}(:,i),'fro');
        data{2}(:,i) = data{2}(:,i)/norm(data{2}(:,i),'fro');
        data{3}(:,i) = skew(data{1}(:,i))*data{3}(:,i);
        data{4}(:,i) = skew(data{2}(:,i))*data{4}(:,i);
    end
end