function T = getT(M,RP,B,xP)
    d = length(B);
    T = zeros(d);
    for i = 1:d
        r = RP==xP(B(i));
        if ~r; T(i,B==xP(B(i))) = 1; else; T(i,:) = M(r,:); end
    end
end