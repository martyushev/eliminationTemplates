# display solver statistics
function disp_stats(stats)

    @printf "\n%-30s %-30s\n" "Problem:" stats.name
    @printf "%-30s %-30.2f\n" "Ave. runtime (ms):" 10^3*Statistics.mean(stats.tm)
    @printf "%-30s %-30.2f\n" "Max. num. error:" maximum(stats.err)
    @printf "%-30s %-30.2f\n" "Ave. num. error:" Statistics.mean(stats.err)
    @printf "%-30s %-30.2f\n" "Med. num. error:" Statistics.median(stats.err)
    @printf "%-30s %-30.1f\n" "Fails (%):" Statistics.mean(stats.flr)*100
    @printf "%-30s %-30.2f\n" "Ave. sharpness:" Statistics.mean(stats.shrp)
    @printf "%-30s %-30.2f\n" "Med. sharpness:" Statistics.median(stats.shrp)
    @printf "%-30s %-30d\n" "Min. number of roots:" minimum(stats.k)
    @printf "%-30s %-30d\n" "Max. number of real roots:" maximum(stats.kr)
    @printf "%-30s %-30.1f\n" "Ave. number of real roots:" Statistics.mean(stats.kr)

end