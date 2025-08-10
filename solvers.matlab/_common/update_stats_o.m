% update solver statistics (optimized)
function stats = update_stats_o(stats,Ir,e)

    kr = nnz(Ir); % number of real roots
    e1 = e(1:end-1);
    k = numel(e1);
    err = log10(norm(e1,'fro')); % numerical error
    flr = ~isempty(e1(e1>1e-3)); % failure identifier
    if e(k+1)==-1; shrp = -Inf; else; shrp = log10(e(k)/e(k+1)); end % boundary sharpness

    stats.err = [stats.err err];
    stats.flr = [stats.flr flr];
    stats.shrp = [stats.shrp shrp];
    stats.k = [stats.k k];
    stats.kr = [stats.kr kr];

end