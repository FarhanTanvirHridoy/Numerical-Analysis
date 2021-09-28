a = 0;
b = 0.6;
h = 0.2; % h = (b-a)/n
x = a:h:b;
es = 0.01;
f = @(x,y) 2*x/y + x*y;
y(1) = 1;
for i = 1:length(x) - 1
    fprintf('\nIteration 0: \n');
    
    predictor = y(i) + h*f(x(i),y(i));
    fprintf('Predictor: y%d = %f\n',i+1,predictor);
    yi0 = y(i) + h/2*(f(x(i),y(i)) + f(x(i+1), predictor));
    fprintf('Corrector: y%d = %f\n',i+1,yi0);
    
    e = abs((yi0-y(i))/yi0);
    fprintf('Error = %f%%\n',e*100);
    j=1;
    while e>es
        fprintf('\nIteration %d: \n',j);
        yin = y(i) + h/2*(f(x(i),y(i))+f(x(i+1),yi0));
        fprintf('y%d = %f\n',i+1,yin);
        
        e = abs((yin - yi0)/yin);
        fprintf('Error = %f%%\n',e*100);
        yi0 = yin;
        
        
        j = j+1;
    end
    y(i+1) = yin;
    fprintf('\nSo, y(%f) = %f\n', x(i+1),y(i+1));
end