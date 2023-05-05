function [data,S,R,Sgt,Rgt] = inidata_feas_toa_55()

    Sgt = rand(3,5); % ground truth coordinates of 5 senders
    Rgt = rand(3,5); % ground truth coordinates of 5 receivers
    D = zeros(5,5); % squared distances
    tD = zeros(5,5);
    for i = 1:5
        for j = 1:5
            D(i,j) = (Rgt(:,i)-Sgt(:,j))'*(Rgt(:,i)-Sgt(:,j));
            tD(i,j) = (D(i,j)-D(i,1)-D(1,j)+D(1,1))/(-2);
        end
    end
    tD = tD(2:5,2:5);
    [R,d,S] = svd(tD);
    R = (R(:,1:3)*d(1:3,1:3))';
    S = S(:,1:3)';
    %disp(R'*S-tD);
    
    M = zeros(4,10);
    M(:,1) = D(2:5,1)-D(1,1);
    M(:,[2,5,7]) = -[R(1,:).^2; R(2,:).^2; R(3,:).^2]';
    M(:,[3,4,6]) = -2*[R(1,:).*R(2,:); R(1,:).*R(3,:); R(2,:).*R(3,:)]';
    M(:,8:10) = 2*R';
    
    [~,~,V] = svd(M);
    V = V(:,end-5:end);
    %disp(M*V);
    V = V(2:end,:)./V(1,:);
    %disp(M(:,1)+M(:,2:end)*V);
    V = [V(:,1), V(:,2:end)-V(:,1)];
    %disp(M(:,2:end)*V(:,2:end));

    data = cell([1,1]);
    data{1} = zeros(71,1);
    data{1}(1:9) = V(:,1);
    data{1}(10:18) = V(:,2);
    data{1}(19:27) = V(:,3);
    data{1}(28:36) = V(:,4);
    data{1}(37:45) = V(:,5);
    data{1}(46:54) = V(:,6);
    data{1}(55:66) = S(:);
    data{1}(67:70) = D(1,2:5)-D(1,1);
    data{1}(71) = D(1,1);
    
end