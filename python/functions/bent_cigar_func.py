import numpy as np
    
def bent_cigar_func(x = None): 
    # F16 Bent Cigar function
# Search range: [-100, 100]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    x2toend = x(np.arange(2,D+1))
    sum1 = np.sum(x2toend ** 2, 2-1)
    y = x(1) ** 2 + 1000000 * sum1
    return y
    
    return y