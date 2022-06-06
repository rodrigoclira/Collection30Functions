import numpy as np
    
def sumpow2_func(x = None): 
    # F22 Sum of Different Powers 2 function
# Search range: [-10, 10]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    Array1 = np.array([np.arange(1,D+1)])
    y = np.sum((np.abs(x)) ** (2 + 4 * (Array1 - 1) / (D - 1)), 2-1)
    return y
    
    return y