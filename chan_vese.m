function [phis, u, v, E] = chan_vese(I, phi0, deltaT, lambda1, lambda2, mu, nu, iteration)

E = zeros(iteration,1);
[m, n] = size(phi0);
phis = zeros(iteration, m, n);
phi = phi0;

for i = 1:iteration
    
    u = sum(sum(I(phi < 0)))/length(I(phi < 0));
    v = sum(sum(I(phi > 0)))/length(I(phi > 0)); 
    kappa = curvature(phi);
    in = (I-u).^2;
    out = (I-v).^2;
    normPositive = entropy_norm(phi,1);
    normNegative = entropy_norm(phi,-1);
    
    phi = phi + deltaT.*(lambda1.*in.*normPositive - lambda2.*out.*normNegative - mu.*kappa + nu.*normPositive);
    phis(i, :, :) = phi;
    
    c = contourc(phi, [0 0]);
    curr = 1;
    len = 0;
    while curr < length(c)
        if c(1,curr) == 0
            for j = (curr+1):(curr+c(2,curr)-1)
                len = len + sqrt((c(1,j)-c(1,j+1)).^2 + (c(2,j)-c(2,j+1)).^2);
            end
            curr = j+1;
        end
        curr = curr + 1;
    end
    
    E(i) = lambda1.*sum(sum(in(phi < 0))) + lambda2.*sum(sum(out(phi > 0))) + mu.*len + nu.*length(in(phi < 0));
end

end