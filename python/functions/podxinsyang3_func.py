import numpy as np
    
def modxinsyang3_func(x = None): 
    # F29 Modified Xin-She Yang’s 3 function
# Search range: [-20, 20]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    sum1 = np.sum((x / 15) ** 10, 2-1)
    sum2 = sum(x ** 2)
    y = 10000.0 * (1 + (np.exp(- sum1) - 2 * np.exp(- sum2)) * np.prod(np.cos(x) ** 2))
    return y
    
    return y