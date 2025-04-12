
function Rt = getRt6p_gen(data,u)
    % compute rotation matrix R
    nu = u.'*u;
    R = 2*(u*u.'-skew(u))+(1-nu)*eye(3);
    R = R./(1+nu);

    S = zeros(6,4);
    for i = 1:6
        S(i,1:3) = -cross(R*data{1}(:,i),data{2}(:,i));
        S(i,4) = data{2}(:,i).'*R*data{3}(:,i)+data{1}(:,i).'*R.'*data{4}(:,i);
    end

    % compute translation vector t
    [~,~,V] = svd(S,0);
    t0 = V(:,4);
    t = t0(1:3)./t0(4);

    Rt = [reshape(R',1,9), t'];
end