% update solver statistics
function [stats,S] = update_stats(stats,S,C,U,dU,d,varargin)

    p = inputParser;
    addRequired(p,'stats',@isstruct);
    addRequired(p,'S',@isnumeric);
    addRequired(p,'C',@isnumeric);
    addRequired(p,'U',@(f)isa(f,'function_handle'));
    addRequired(p,'dU',@(f)isa(f,'function_handle'));
    addRequired(p,'d',@isscalar);
    addOptional(p,'iterRef',0);
    parse(p,stats,S,C,U,dU,d,varargin{:});
    
    n = size(S,2);
    k = min(d,n); % number of roots
    e = ones(1,n);
    for i = 1:n
        x = num2cell(S(:,i));
        m = U(x{:}).';
        e(i) = norm(C*m,'fro')/norm(m,'fro');
    end
    [e,I] = sort(e);
    S = S(:,I(1:k));
    e1 = e(1:k);
    
    kr = nnz(~any(imag(S))); % number of real roots
    if p.Results.iterRef
        tic;
        [e1,S] = iteref(e1,S,C,U,dU);
        stats.tm(end) = stats.tm(end)+toc;
    end
    
    err = log10(norm(e1,'fro')); % numerical error
    flr = ~isempty(e1(e1>1e-3)); % failure identifier
    if n==k; shrp = -Inf; else; shrp = log10(e1(k)/e(k+1)); end % boundary sharpness
    stats.err = [stats.err err];
    stats.flr = [stats.flr flr];
    stats.shrp = [stats.shrp shrp];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];
    
end