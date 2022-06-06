import numpy as np
    
def alpine1_func(x = None): 
    # F07 Alpine 1 function
# Search range: [-10, 10]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    y = np.sum(np.abs(np.multiply(x,np.sin(x)) + 0.1 * x), 2-1)
    return y
    
    return y