import numpy as np
    
def salomon_func(x = None): 
    # F26 Salomon function
# Search range: [-20, 20]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    sum1 = sum(x ** 2)
    y = 1 - np.cos(2 * pi * np.sqrt(sum1)) + 0.1 * np.sqrt(sum1)
    return y
    
    return y