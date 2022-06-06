import numpy as np
    
def rosenbrock_func(x = None): 
    # F13 Rosenbrock's function
# Search range: [-10, 10]^D
# Minimum: f(x*)=0 at x*={1, 1, ..., 1}
    
    D = x.shape[2-1]
    
    xiplus1 = x(np.arange(2,D+1))
    xi = x(np.arange(1,D - 1+1))
    sum1 = sum(100 * (xiplus1 - xi ** 2) ** 2 + (xi - 1) ** 2)
    y = sum1
    return y
    
    return y