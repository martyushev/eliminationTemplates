# cross product skew-symmetric matrix
function skew(t::Vector)

    T = [0 -t[3] t[2]; t[3] 0 -t[1]; -t[2] t[1] 0]
    return T

end