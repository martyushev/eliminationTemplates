% backward errors, maximal error and geometric mean of errors
function [maxe,gme,k,kr] = bwe2(C,mon,S,d)
    n = size(S,2);
    k = min(d,n); % number of roots
    e = zeros(1,n);
    for i=1:n
        x = num2cell(S(:,i));
        m = mon(x{:}).';
        m = m/norm(m,'fro');
        e(i) = norm(C*m,'fro');
    end
    [e,I] = sort(e);
    e = e(1:k);
    maxe = max(e); % maximal error
    gme = geomean(e); % geometric mean of errors
    kr = length(I(~imag(S(1,I(1:k))))); % number of real roots
end