import numpy as np
    
def schafferf7_func(x = None): 
    # F18 Schaffer’s F7 function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    xiplus1 = x(np.arange(2,D+1))
    xi = x(np.arange(1,D - 1+1))
    si = np.sqrt(xi ** 2 + xiplus1 ** 2)
    sum1 = sum(np.sqrt(si) + np.multiply(np.sqrt(si),(np.sin(50 * si ** 0.2)) ** 2))
    y = (1 / (D - 1) * sum1) ** 2
    return y
    
    return y