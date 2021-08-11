function A = getA(M,RP,B,B1,xP)
    d = length(B);
    A = zeros(d);
    for i = 1:d
        r = RP==xP(B1(i));
        if ~r; A(i,B==xP(B1(i))) = 1; else; A(i,:) = M(r,:); end
    end
end