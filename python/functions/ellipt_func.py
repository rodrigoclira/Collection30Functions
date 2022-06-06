import numpy as np
    
def ellipt_func(x = None): 
    # F14 High Conditioned Elliptic function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    Array1 = np.array([np.arange(1,D+1)])
    sum1 = sum(np.multiply((1000000) ** ((Array1 - 1) / (D - 1)),x ** 2))
    y = sum1
    return y
    
    return y