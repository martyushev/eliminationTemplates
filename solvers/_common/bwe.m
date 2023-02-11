% find backward errors, maximal error and geometric mean of errors, number of real roots
function [maxe,gme,k,kr] = bwe(C,mon,S,d)
    s = size(C,1); % number of polynomials
    n = size(S,2);
    k = min(d,n); % number of roots
    e = zeros(1,n);
    for i=1:n
        x = num2cell(S(:,i));
        m = mon(x{:}).';
        e(i) = sum(abs(C*m)./(abs(C)*abs(m)+ones(s,1)));
    end
    [e,I] = sort(e);
    e = e(1:k)./s;
    maxe = max(e); % maximal error
    gme = geomean(e); % geometric mean of errors
    kr = length(I(~imag(S(1,I(1:k))))); % number of real roots
end