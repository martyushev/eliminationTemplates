% find numerical error and number of real roots
function [err,k,kr] = numerr(C,mon,S,d)
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
    err = log10(norm(e,'fro')); % numerical error
    kr = length(I(~imag(S(1,I(1:k))))); % number of real roots
end