import numpy as np
    
def hgbat_func(x = None): 
    # F12 HGBat function
# Search range: [-15, 15]^D
# Minimum: f(x*)=0 at x*={-1, -1, ..., -1}
    
    D = x.shape[2-1]
    sum1 = np.sum(x, 2-1)
    sum2 = np.sum(x ** 2, 2-1)
    y = (np.abs(sum2 ** 2 - sum1 ** 2)) ** (1 / 2) + (0.5 * sum2 + sum1) / D + 0.5
    return y
    
    return y