format long;
f = @(x) exp(-x);
elimit = 0.0001;
xold = input('Enter guess value: ');
i = 1;
while(true)
    fprintf('\niteration %d\n',i);
    xnew = f(xold);
    e = abs((xnew - xold)/xnew)*100;
    fprintf('xi = %8f\nerror = %8f%%\n',xnew,e);
    if e/100<=elimit break;
    end    
    xold = xnew;
    i = i + 1;
end
fprintf('\nRoot is %f\n',xnew);