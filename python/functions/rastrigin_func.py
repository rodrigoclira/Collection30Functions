import numpy as np
    
def rastrigin_func(x = None): 
    # F10 Rastrigin's function
# Search range: [-5.12, 5.12]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    sum1 = np.sum(x ** 2 - 10 * np.cos(2 * pi * x), 2-1)
    y = sum1 + 10 * D
    return y
    
    return y