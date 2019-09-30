clc
clear
close all
tic

x = -pi : 0.01 : pi;
y = sin(x);
my_noise = 0.1*randn(size(y));
z = y+my_noise;

% a1 = 0.25;
% a2 = 0.25;
% a3 = 0.25;
% a4 = 0.25;
% 
% for n = 1+3:size(x,2)
%     y_denoise(n) = a1*z(n) + a2*z(n-1) + a3*z(n-2) + a4*z(n-3);
% end

k = 30;
a = 0.1*ones(1,k);
y_denoise = zeros(size(z));
for n = k:size(x,2)
    y_denoise(n) = sum(a .* z(n-k+1:n));
end

figure(1);
subplot(2,2,1); plot(x,y); title('data');
subplot(2,2,2); plot(x,my_noise); title('noise');
subplot(2,2,3); plot(x,z); title('noisy data');
subplot(2,2,4); plot(x,y_denoise); title('denoise data');

toc

