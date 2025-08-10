% validate roots and remove false ones
function [S,Ir,e] = validate_roots(S,C,U,dU,nRoots,iterRef)

    n = size(S,2);
    k = min(nRoots,n); % number of roots
    e = U(S,n);
    e = e./repmat(sqrt(sum(e.*conj(e),1)),size(e,1),1);
    e = C*e;
    e = sqrt(sum(e.*conj(e),1));
    [e,I] = sort(e);
    S = S(:,I(1:k));
    e1 = e(1:k);
    if iterRef; [e1,S] = iteref_o(e1,S,C,U,dU); end
    if n == k; e = [e1, -1]; else; e = [e1, e(k+1)]; end
    Ir = ~any(imag(S)); % mask for real roots

end