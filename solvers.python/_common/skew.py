import numpy as np

# cross product skew-symmetric matrix
def skew(t):
    T = np.array([[0, -t[2], t[1]],
                  [t[2], 0, -t[0]],
                  [-t[1], t[0], 0]])
    return T