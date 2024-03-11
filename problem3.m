U = 200;
A = 3.192;
cmin = 212.8;
cmax = 755.25;
cr = 0.282;
qmax = 21280;
ho = zeros(1,5);
co = zeros(1,5);
i = 1;
hi = 400;
ci = 300;
for U = U:50:400
    NTU = (U*A)/(cmin);
    eps = 1-exp(((1/cr)*(NTU)^0.22)*(exp(-cr*(NTU)^0.78)-1)); 
    q = eps*qmax;
    ho(i) = hi -(q/cmin);
    co(i) = ci + (q/cmax);
    i = i+1;
end
x = 200:50:400;
plot(x, ho);
hold on
plot (x,co);
title('Outlet Tempuratures as U Increases ');
xlabel('U (W/m^2*K');
ylabel('Outlet Temperatures (K)');
legend('Hot Water Outlet Temp', 'Cold Air Outlet Temp');