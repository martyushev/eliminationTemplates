% display statistics
function disp_stats(stats,hist)
    if ~exist('hist','var'); hist = 0; end
    g = '30'; % gap
    fprintf(['%-', g, 's %-', g, 's\n'],'Problem:',stats.problem);
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Average runtime (ms):',10^3*mean(stats.tm));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Mean num. error:',mean(stats.err));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Median num. error:',median(stats.err));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Min. number of roots:',min(stats.k));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Max. number of real roots:',max(stats.kr));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Ave. number of real roots:',mean(stats.kr));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Fails (%):',(1-length(stats.k)/stats.N)*100);
    if hist==1; plot_histo_num(stats); end
end