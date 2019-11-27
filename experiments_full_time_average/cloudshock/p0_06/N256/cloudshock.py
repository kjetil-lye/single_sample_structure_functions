import numpy as np
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):

    N = len(a)//4
    a1 = a[:N]
    a2 = a[N:2*N]
    b1 = a[2*N:3*N]
    b2 = a[3*N:4*N]


    perturbation = epsilon

    normalization1 = sum(a1)

    if abs(normalization1) < 1e-10:
        normalization1 = 1
    normalization2 = sum(a2)
    if abs(normalization2) < 1e-10:
        normalization2 = 1

    x = np.linspace(ax, bx, nx)
    y = np.linspace(ay, by, ny)

    X, Y =np.meshgrid(x, y)


    r = np.sqrt((X-0.25)**2 + (Y-0.5)**2)
    phi = np.arctan2(X-0.25, Y - 0.5)
    perturbation_x = perturbation*np.sum([a1[i]*np.cos(2*np.pi*(i+1)*(Y+b1[i])) for i in range(len(a1))], axis=0)/normalization1
    perturbation_r = perturbation*np.sum([a2[i]*np.cos(2*np.pi*(i+1)*(phi+b2[i])) for i in range(len(a2))], axis=0)/normalization2

    #
    r_max = 0.13
    left_x = (x < 0.05 + perturbation_x)
    cloud = r < r_max + perturbation_r

    rho[:,:,0] = left_x*3.86859 + (1-left_x)*(cloud*10.0 + (1-cloud)*1.0)
    ux[:,:,0] = 11.2536*left_x
    uy[:,:,:] = np.zeros_like(ux)
    
    p[:,:,0] = 167.345*left_x + (1-left_x)*1.0
