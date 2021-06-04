import numpy as np

# Write a function that takes as input a list of numbers, and returns
# the list of values given by the softmax function.
def softmax(L):
    # values = L
    # print(values)
    # values = list()
    # for i in range(len(L)):
    #     values.append(np.exp(L[i]) / np.sum(np.exp(L)))
    return [np.exp(L[i]) / np.sum(np.exp(L)) for i in range(len(L))]