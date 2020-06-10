function plot_res(I, phi, iteration, i, E) % mu, nu
% figure;
n = size(I, 1);
subplot(2,4,i);
% subplot(1,2,1);
% subplot(2,5,i);
imshow(I); 
colormap(gray); 
hold on
title(sprintf('Contour at Iteration %d', iteration));  % ['\mu = ', sprintf('%.1f', mu)]
contour(phi, [0 0], 'b');
hold off

subplot(2,4,i+4);
% subplot(1,2,2);
segment = zeros(n,n);
segment(phi > 0) = 1;
segmentI = mat2gray(segment);
imshow(segmentI)
title(sprintf('Segmentation at Iteration %d', iteration));

% subplot(2,5,i+5);
% plot(1:iteration,E);
% xlabel('Number of Iterations')
% ylabel('Energy')
% title('Energy')


