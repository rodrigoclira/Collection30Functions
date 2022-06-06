import numpy as np
    
def weierstrass_func(x = None): 
    # F06 Weierstrass function
# Search range: [-0.5, 0.5]^D
# Minimum: f(x*)=0 at x*={0, 0, ..., 0}
    
    D = x.shape[2-1]
    
    a = 0.5
    b = 3
    k_max = 20
    kVec = np.array([np.arange(0,k_max+1)])
    sum2 = np.sum(np.multiply(a ** kVec,np.cos(pi * b ** kVec)), 2-1)
    f = 0
    for i in np.arange(1,D+1).reshape(-1):
        sum1 = np.sum(np.multiply(a ** kVec,np.cos(2 * pi * b ** kVec * (x(i) + 0.5))), 2-1)
        f = f + sum1
    
    y = f - D * sum2
    return y
    
    return y