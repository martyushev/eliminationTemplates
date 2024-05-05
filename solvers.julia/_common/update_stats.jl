# update solver statistics
function update_stats(stats,S,C,U,d)
    
    n = size(S,2)
    k = min(d,n) # number of roots
    e = ones(n)
    for i in 1:n
        m = U(S[:,i]...)
        e[i] = norm(C*m)/norm(m)
    end
    I = sortperm(e)
    e = e[I]
    S = S[:,I[1:k]]
    e1 = e[1:k]
    
    kr = count(all(c -> isreal(c), S; dims=1)) # number of real roots
    err = log10(norm(e1)) # numerical error
    flr = !isempty(e1[e1.>1e-3]) # failure identifier
    if n==k; shrp = -Inf; else; shrp = log10(e1[k]/e[k+1]); end # boundary sharpness
    stats.err = [stats.err; err]
    stats.flr = [stats.flr; flr]
    stats.shrp = [stats.shrp; shrp]
    stats.k = [stats.k; k]
    stats.kr = [stats.kr; kr]

    return stats
    
end