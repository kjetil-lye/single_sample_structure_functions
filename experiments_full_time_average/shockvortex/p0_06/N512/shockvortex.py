K = len(a)//10

a1 = a[:K]
b1 = a[K:2*K]

GAMMA=1.66666666666667

r_c = 0.05
alpha = 0.204
x_c = 0.25
y_c = 0.5
M = 1.1

perturbation = epsilon
normalization1 = sum(a1)
if abs(normalization1) < 1e-10:
    normalization1 = 1
#
perturbation_x = perturbation*sum([a1[i]*cos(2*pi*(i+1)*(y+b1[i])) for i in range(len(a1))])/normalization1


# shock part
if  x < 0.5 + perturbation_x: 
    rho = 1.0;
    ux = sqrt(GAMMA);
    uy = 0.0;
    p = 1.0;
else:
    rho = 1.0 / 1.1;
    ux = 1.1 * sqrt(GAMMA);
    uy = 0.0;
    p = 1 - 0.1 * GAMMA;

# different value than
# book by Shu ( https://link.springer.com/chapter/10.1007/BFb0096355 page 407 )
# They use 0.3, but that doesn't lead to a prominent vortex.
vortex_epsilon=1
# vortex part
if x < 0.5:
    tau = sqrt(pow(x - x_c, 2) + pow(y - y_c, 2)) / r_c;
    sin_theta = (y - y_c) / (tau * r_c);
    cos_theta = (x - x_c) / (tau * r_c);

    ux += vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * sin_theta;
    uy += -vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * cos_theta;
    p += -(GAMMA - 1) * pow(vortex_epsilon, 2) * exp(2 * alpha*(1 - pow(tau, 2))) / (4 * alpha * GAMMA) * rho;



