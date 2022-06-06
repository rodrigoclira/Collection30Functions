import numpy as np
    
def schwefel221_func(x = None): 
    # F24 Schwefel 2.21 function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    y = np.amax(np.abs(x))
    return y
    
    return y