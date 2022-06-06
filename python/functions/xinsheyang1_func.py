import numpy as np
    
def xinsheyang1_func(x = None): 
    # F23 Xin-She Yang’s 1 function
# Search range: [-2*pi, 2*pi]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    sum1 = sum(np.abs(x))
    sum2 = sum(np.sin(x ** 2))
    y = sum1 * np.exp(- sum2)
    return y
    
    return y