% display statistics
function disp_stats(stats,N)
    g = '30'; % gap
    fprintf(['%-', g, 's %-', g, 's\n'],'Problem:',stats.problem);
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Average runtime (ms):',10^3*mean(stats.tm));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Median max. bwe:',log10(median(stats.maxe)));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Median geom. mean bwe:',log10(median(stats.gme)));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Min. number of roots:',min(stats.k));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Max. number of real roots:',max(stats.kr));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Ave. number of real roots:',mean(stats.kr));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Fails (%):',(1-length(stats.k)/N)*100);
end