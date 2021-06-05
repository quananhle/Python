import numpy as np

# Write a function that takes as input two lists Y, P,
# and returns the float corresponding to their cross-entropy.
def cross_entropy(Y, P):
    assert (len(Y) == len(P))
    # CE = list()
    # for i in range (len(P)):
    #     CE.append(Y[i] * np.log(P[i]) + (1 - Y[i]) * np.log(1 - P[i]))
    # return -np.sum(CE)
    return -np.sum([Y[i]*np.log(P[i]) + (1 - Y[i]) * np.log(1 - P[i]) for i in range(len(P))])
    
    # Y = np.float_(Y)
    # print(Y)
    # P = np.float_(P)
    # print(P)
    # return -np.sum(Y * np.log(P) + (1 - Y) * np.log(1 - P))