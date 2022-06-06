import numpy as np
    
def modxinsyang5_func(x = None): 
    # F30 Modified Xin-She Yang’s 5 function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    sum1 = np.sum(np.sin(x) ** 2, 2-1)
    sum2 = np.sum(x ** 2, 2-1)
    sum3 = np.sum(np.sin(np.sqrt(np.abs(x))) ** 2, 2-1)
    y = 10000.0 * (1 + np.multiply((sum1 - np.exp(- sum2)),np.exp(- sum3)))
    return y
    
    return y