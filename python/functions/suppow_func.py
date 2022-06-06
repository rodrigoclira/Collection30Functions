import numpy as np
    
def sumpow_func(x = None): 
    # F03 Sum of Different Powers function
# Search range: [-10, 10]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    Array1 = np.array([np.arange(2,D + 1+1)])
    y = np.sum((np.abs(x)) ** Array1, 2-1)
    return y
    
    return y