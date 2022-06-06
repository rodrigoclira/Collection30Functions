import numpy as np
    
def schwefel222_func(x = None): 
    # F25 Schwefel 2.22 function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    y = sum(np.abs(x)) + np.prod(np.abs(x))
    return y
    
    return y