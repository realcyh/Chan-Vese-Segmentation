n = 500;
pic = 'pics/leonardo.jpg';
image = rgb2gray(imread(pic));
I = imresize(image, [n, n]);
I_gaussian = imnoise(I, 'gaussian');
I_salt = imnoise(I, 'salt & pepper');

II = double(I)./max(max(double(I)));

[Y,X] = meshgrid(1:n,1:n);
cir = 1;
r = .1*n/cir;
phi0 = zeros(n,n)+Inf;
for i=1:n
    for j=1:n
        c = ([i j]-1)*(n/cir)+(n/cir)*.5;
        phi0 = min( phi0, sqrt( (X-c(1)).^2 + (Y-c(2)).^2 ) - r );
    end
end

deltaT = 0.1;
lambda1 = 1.0;
lambda2 = 1.0;
mu = 0.5;
nu = 0;
iteration = 10;

[phis, u, v, E] = chan_vese(II, phi0, deltaT, lambda1, lambda2, mu, nu, iteration);

phi2 = reshape(phis(2, :, :), n, n);
phi5 = reshape(phis(5, :, :), n, n);
phi = reshape(phis(10, :, :), n, n);
plot_res(I, phi0, 0, 1, E);
plot_res(I, phi2, 2, 2, E);
plot_res(I, phi5, 5, 3, E);
plot_res(I, phi, 10, 4, E);

% set(gcf,'unit','centimeters','position',[15 10 38 13])
