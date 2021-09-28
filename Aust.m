format short;
f = @(x) 2*cos(x);
s = [];
for i = -10:1:9    
    if f(i)*f(i+1) < 0        
        s = [s; i i+1];
    end
end

[n, ~] = size(s);
for i = 1:n
xl = s(i,1);
xu = s(i,2);
elimit = 0.0001; xold = 0.0;

while(true)
    
    xr = (xl+xu)/2;
    e = abs((xr - xold)/xr)*100;
    
    if f(xr)*f(xl) > 0
        xl = xr;
    elseif f(xr)*f(xl) < 0
        xu = xr;
    else
        break;
    end
    if abs((xr - xold)/xr)<=elimit
        break;
    end
    xold = xr;
    
end
fprintf('Root is %f radian (%d degree)\n',xr,round(xr*180/pi));
end