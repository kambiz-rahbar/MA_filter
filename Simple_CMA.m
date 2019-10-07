clc
clear
close all
tic

x = -pi : 0.01 : pi;
y = sin(x);
my_noise = 0.1*randn(size(y));
z = y+my_noise;

k = 30;
a = ones(1,k)/k;

y_denoise = zeros(size(z));
for n = k:size(x,2)
    y_denoise(n) = sum(a .* z(n-k+1:n));
end

y_centdenoise = zeros(size(z));
for n = floor(k/2):size(x,2)-floor(k/2)
    y_centdenoise(n) = sum(a .* z(n-floor(k/2)+1:n+floor(k/2)));
end

figure(1);
subplot(2,2,1); plot(x,y); title('data');
subplot(2,2,2); plot(x,my_noise); title('noise');
subplot(2,2,3); plot(x,z); title('noisy data');

subplot(2,2,4);  hold on;
plot(x,y_denoise,'b');
plot(x,y_centdenoise,'r'); 
plot(x,y,'k');
hold off;
legend('MA','CMA','ref');

toc