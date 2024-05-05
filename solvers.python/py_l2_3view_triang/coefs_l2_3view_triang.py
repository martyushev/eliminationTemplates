import numpy as np

def coefs_l2_3view_triang(data):
    E12 = data[0].T.flat
    E23 = data[1].T.flat
    u = data[2].T.flat

    C = np.zeros((8,25))
    C.flat[[16,42,68,94,120,146]] = 2
    C.flat[24] = -2*u[0]
    C.flat[49] = -2*u[1]
    C.flat[74] = -2*u[2]
    C.flat[99] = -2*u[3]
    C.flat[124] = -2*u[4]
    C.flat[149] = -2*u[5]
    C.flat[[10,58,150]] = E12[0]
    C.flat[[35,59,151]] = E12[1]
    C.flat[[72,168]] = E12[2]
    C.flat[[11,83,152]] = E12[3]
    C.flat[[36,84,153]] = E12[4]
    C.flat[[97,169]] = E12[5]
    C.flat[[22,166]] = E12[6]
    C.flat[[47,167]] = E12[7]
    C.flat[174] = E12[8]
    C.flat[[64,112,179]] = E23[0]
    C.flat[[89,113,180]] = E23[1]
    C.flat[[123,195]] = E23[2]
    C.flat[[65,137,181]] = E23[3]
    C.flat[[90,138,182]] = E23[4]
    C.flat[[148,196]] = E23[5]
    C.flat[[73,193]] = E23[6]
    C.flat[[98,194]] = E23[7]
    C.flat[199] = E23[8]

    C = C/np.sqrt(np.sum(C*np.conj(C),axis=1,keepdims=True))

    def U(x1,x2,x3,x4,x5,x6,x7,x8):
        return np.array([x3*x1,x3*x2,x4*x1,x4*x2,x5*x3,x4*x5,x6*x3,x6*x4,x7*x1,x7*x2,x7*x3,x7*x4,x8*x3,x8*x4,x8*x5,x8*x6,x1,x2,x3,x4,x5,x6,x7,x8,1])

    return C,U