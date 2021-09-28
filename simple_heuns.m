a = 0;
b = 0.6;
h = 0.2; % h = (b-a)/n
x = a:h:b;
es = 0.01;
f = @(x,y) 2*x/y + x*y;
y(1) = 1;
for i = 1:length(x) - 1
    
    
    predictor = y(i) + h*f(x(i),y(i));
    fprintf('Predictor: y%d = %f\n',i+1,predictor);
    y(i+1) = y(i) + h/2*(f(x(i),y(i)) + f(x(i+1), predictor));
    fprintf('Corrector: y%d = %f\n',i+1,y(i+1));
    
    
    
    fprintf('\nSo, y(%f) = %f\n', x(i+1),y(i+1));
end