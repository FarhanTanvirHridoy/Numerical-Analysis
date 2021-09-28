a = 0;
b = 0.6;
h = 0.2; % h = (b-a)/n
x = a:h:b;
es = 0.01;
f = @(x,y) 2*x/y + x*y;
y(1) = 1;
for i = 1:length(x) - 1
    xi_half = x(i) + h/2;
    yi_half = y(i) + h/2*f(x(i),y(i));
    
    y(i+1) = y(i) + h*f(xi_half,yi_half);
    fprintf('\n\nxi_1/2 = %f\nyi_1/2 = %f',xi_half,yi_half);
    fprintf('\nSo, y(%f) = %f\n', x(i+1),y(i+1));
end