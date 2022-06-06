import numpy as np
    
def ellipsoid_func(x = None): 
    # F02 Ellipsoid function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    Array1 = np.array([np.arange(1,D+1)])
    y = np.sum(x ** 2.0 * Array1, 2-1)
    return y
    
    return y