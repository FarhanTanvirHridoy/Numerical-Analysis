format short;
f = @(x) 2*cos(x);
s = [];
for i = -10:1:10    
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
    fprintf('\niteration %d\n',i);
    xr = (xl+xu)/2;
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