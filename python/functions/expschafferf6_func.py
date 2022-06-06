import numpy as np
    
def expschafferf6_func(x = None): 
    # F19 Expanded Schaffer’s F6 function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    g = lambda z = None,y = None: 0.5 + (np.sin(np.sqrt(z ** 2 + y ** 2)) ** 2 - 0.5) / (1 + 0.001 * (z ** 2 + y ** 2)) ** 2
    sum1 = 0
    for i in np.arange(1,D - 1+1).reshape(-1):
        sum1 = sum1 + g(x(i),x(i + 1))
    
    y = sum1 + g(x(D),x(1))
    return y
    
    return y