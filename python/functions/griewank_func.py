import numpy as np
    
def griewank_func(x = None): 
    # F09 Griewank's function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    Array1 = np.array([np.arange(1,D+1)])
    sum1 = np.sum(x ** 2, 2-1) / 4000
    prod1 = np.prod(np.cos(x / np.sqrt(Array1)))
    y = sum1 - prod1 + 1
    return y
    
    return y