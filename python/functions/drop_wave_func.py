import numpy as np
    
def drop_wave_func(x = None): 
    # F05 Drop-Wave function
# Search range: [-5.12, 5.12]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    sum1 = np.sum(x ** 2, 2-1)
    y = 1 - (1 + np.cos(12 * np.sqrt(sum1))) / (0.5 * sum1 + 2)
    return y
    
    return y