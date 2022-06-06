import numpy as np
    
def ackley_func(x = None): 
    # F08 Ackley's function
# Search range: [-32.768, 32.768]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    sum1 = np.sum(x ** 2, 2-1)
    sum2 = np.sum(np.cos(2 * pi * x), 2-1)
    y = - 20 * np.exp(- 0.2 * np.sqrt(sum1 / D)) - np.exp(sum2 / D) + np.exp(1) + 20
    return y
    
    return y