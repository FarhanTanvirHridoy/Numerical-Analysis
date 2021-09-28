C_1 = 3.74177e8;
C_2 = 1.43878e4;
E = @(lambda,T) C_1./(lambda.^5 .* exp(C_2./(lambda.*T)) - 1);

Temp = [100, 200, 500, 1000, 2000, 4000, 5800];

for t = Temp
    l = logspace(-2,3);
    
    y = E(l,t);
    
    loglog(l,y);
    hold on;
    axis([0.01 1000 1e-6 1e9]);
    
end
legend('100K','200K','500K','1000K','2000K', '4000K', '5800K');
grid on;
grid minor;
title("Planck's Law");
xlabel('\lambda');
ylabel('E(T)');
