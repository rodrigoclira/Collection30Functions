import numpy as np
    
def zakharov_func(x = None): 
    # F28 Zakharov function
# Search range: [-10, 10]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    Array1 = np.array([np.arange(1,D+1)])
    sum1 = sum(x ** 2)
    sum2 = np.sum(np.multiply(0.5 * Array1,x), 2-1)
    y = sum1 + sum2 ** 2 + sum2 ** 4
    return y
    
    return y