import numpy as np
    
def permdb_func(x = None): 
    # F17 Perm D, Beta function
# Search range: [-D, D]^D generally, [-50, 50]^D in this study
# Minimum: f(x*)=0 at x*={1, 2, ..., D}
    
    D = x.shape[2-1]
    
    Array1 = np.array([np.arange(1,D+1)])
    sum2 = 0
    for i in np.arange(1,D+1).reshape(-1):
        sum1 = np.sum(np.multiply((Array1 ** i + 0.5),((x / Array1) ** i - 1)), 2-1)
        sum2 = sum2 + sum1 ** 2
    
    y = sum2
    return y
    
    return y