% Input: cell arrays TT0 and TT1, value of free variable s
% Output: solution matrix S of size 2x20

function S = red2_6x26_gen5p2v_dim1(TT0,TT1,s)

    T0 = TT0{1}+TT0{2}*s+TT0{3}*s^2+TT0{4}*s^3+TT0{5}*s^4+TT0{6}*s^5;
    T1 = TT1{1}+TT1{2}*s+TT1{3}*s^2+TT1{4}*s^3+TT1{5}*s^4+TT1{6}*s^5;

    [V,~] = eig(T0,T1);
    S = V(18:19,:)./repmat(V(20,:),2,1);
    S = S(:,all(isfinite(S)));

end