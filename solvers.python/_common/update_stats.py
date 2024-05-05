import numpy as np
from numpy.linalg import norm

def update_stats(stats,S,C,U,d):
    n = S.shape[1]
    k = min(d,n) # number of roots
    e = np.ones(n)
    for i in range(n):
        m = U(*S[:,i]).T
        e[i] = norm(C@m)/norm(m)
    e,I = np.sort(e),np.argsort(e)
    S = S[:,I[:k]]
    e1 = e[:k]

    kr = np.count_nonzero(np.all(np.imag(S)==0,axis=0)) # number of real roots
    err = np.log10(norm(e1)) # numerical error
    flr = np.any(e1>1e-3) # failure identifier
    if n == k:
        shrp = -np.inf
    else:
        shrp = np.log10(e1[k-1]/e[k]) # boundary sharpness

    stats['err'].append(err)
    stats['flr'].append(flr)
    stats['shrp'].append(shrp)
    stats['k'].append(k)
    stats['kr'].append(kr)

    return stats