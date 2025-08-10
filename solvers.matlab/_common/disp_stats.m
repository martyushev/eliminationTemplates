% display solver statistics
function disp_stats(stats,varargin)

    p = inputParser;
    addRequired(p,'stats',@isstruct);
    addOptional(p,'plotHist',0);
    addOptional(p,'saveHist',0);
    parse(p,stats,varargin{:});

    g = '30'; % gap
    fprintf(['%-', g, 's %-', g, 's\n'],'Problem:',stats.name);
    fprintf(['%-', g, 's %-', g, 's\n'],'Solver:',stats.solver);
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Ave. runtime (ms):',10^3*mean(stats.tm));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Max. num. error:',max(stats.err));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Ave. num. error:',mean(stats.err));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Med. num. error:',median(stats.err));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Fails (%):',mean(stats.flr)*100);
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Ave. sharpness:',mean(stats.shrp));
    fprintf(['%-', g, 's %-', g, '.2f\n'],'Med. sharpness:',median(stats.shrp));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Min. number of roots:',min(stats.k));
    fprintf(['%-', g, 's %-', g, 'd\n'],'Max. number of real roots:',max(stats.kr));
    fprintf(['%-', g, 's %-', g, '.1f\n'],'Ave. number of real roots:',mean(stats.kr));

    if p.Results.plotHist; plot_histo_num(stats,p.Results.saveHist); end

end