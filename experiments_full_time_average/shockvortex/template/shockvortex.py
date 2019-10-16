
GAMMA=1.66666666666667

r_c = 0.05
alpha = 0.204
x_c = 0.25
y_c = 0.5
M = 1.1



# shock part
if  x < 0.5 + epsilon * X: 
    rho = 1.0;
    ux = sqrt(GAMMA);
    uy = 0.0;
    p = 1.0;
else:
    rho = 1.0 / 1.1;
    ux = 1.1 * sqrt(GAMMA);
    uy = 0.0;
    p = 1 - 0.1 * GAMMA;

# same value as https://link.springer.com/chapter/10.1007/BFb0096355 page 407
vortex_epsilon=0.3
# vortex part
if x < 0.5:
    tau = sqrt(pow(x - x_c, 2) + pow(y - y_c, 2)) / r_c;
    sin_theta = (y - y_c) / (tau * r_c);
    cos_theta = (x - x_c) / (tau * r_c);

    ux += vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * sin_theta;
    uy += -vortex_epsilon * tau * exp(alpha*(1 - pow(tau, 2))) * cos_theta;
    p += -(GAMMA - 1) * pow(vortex_epsilon, 2) * exp(2 * alpha*(1 - pow(tau, 2))) / (4 * alpha * GAMMA) * rho;



