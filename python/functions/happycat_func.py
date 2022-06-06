import numpy as np
    
def happycat_func(x = None): 
    # F11 HappyCat function
# Search range: [-20, 20]^D
# Minimum: f(x*)=0 at x*={-1, -1, ..., -1}
    
    D = x.shape[2-1]
    sum1 = np.sum(x, 2-1)
    sum2 = np.sum(x ** 2, 2-1)
    y = (np.abs(sum2 - D)) ** 0.25 + (0.5 * sum2 + sum1) / D + 0.5
    return y
    
    return y