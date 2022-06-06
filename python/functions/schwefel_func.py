import numpy as np
    
def schwefel_func(x = None): 
    # F21 Schwefel function
# Search range: [-500, 500]^D
# Minimum: f(x*)=0 at x*={c, c, ..., c}
# Where c=420.968746359982025
    
    D = x.shape[2-1]
    y = - sum(np.multiply(x,np.sin(np.sqrt(np.abs(x))))) + 418.9828872724337 * D
    return y
    
    return y