format short;
m = 2000; c= 38000; k=500000;
f = @(x) (m*c*x^3/(k*(k-m*x^2)+(c*x)^2))^0.5 - 0.2;
s = [];
for i = -100:1:100    
    if f(i)*f(i+1) < 0        
        s = [s; i i+1];
    end
end

disp('Suggested guess values: ');
disp(s);

xl = input('Enter lower guess value: ');
xu = input('Enter upper guess value: ');
elimit = 0.0001; xold = 0.0;
i = 1;
while(true)
    fprintf('After iteration %d\n',i);
    xr = xu - f(xu)*(xl - xu)/(f(xl) - f(xu));
    e = abs((xr - xold)/xr)*100;
    fprintf('\txl\t\t\tf(xl)\t\txu\t\tf(xu)\t\txr\t\tf(xr)\terror\n');
    disp([xl;f(xl);xu;f(xu);xr;f(xr);e]');
    if f(xr)*f(xl) > 0
        xl = xr;
    elseif f(xr)*f(xl) < 0;
        xu = xr;
    else break;
    end
    if abs((xr - xold)/xr)<=elimit
        break;
    end
    xold = xr;
    i = i + 1;
end
fprintf('Root is %f\n',xr);