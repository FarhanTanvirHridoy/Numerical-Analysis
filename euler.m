a = 0;
b = 0.6;
h = 0.2; % h = (b-a)/n
x = a:h:b;
es = 0.01;
f = @(x,y) 2*x/y + x*y;
y(1) = 1;
for i = 1:length(x) - 1
    
    
    y(i+1) = y(i) + h*f(x(i),y(i));
    
    fprintf('\nSo, y(%f) = %f\n', x(i+1),y(i+1));
end