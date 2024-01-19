function data = inidata_num_parallel_robot_66()
    data = cell([1,3]);
    data{1} = randn(3,6);
    data{2} = randn(3,6);
    data{3} = randn(1,6).^2; % squared lengths
    data{1}(:,1) = zeros(3,1); % 1st point at the origin
    data{2}(:,1) = zeros(3,1); % 1st point at the origin
end