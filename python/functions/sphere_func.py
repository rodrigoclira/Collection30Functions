import numpy as np
    
def sphere_func(x = None): 
    # F01 Sphere function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    y = np.sum(x ** 2, 2-1)
    return y
    
    return y