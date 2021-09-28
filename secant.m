format long;
f = @(x) exp(-x) - x;
elimit = 0.0001;
xoldold = input('Enter 1st guess value: ');
xold = input('Enter 2nd guess value: ');
i = 1;
while(true)
    fprintf('\nAfter iteration %d\n',i);
    xnew = xold - f(xold)*(xoldold-xold)/(f(xoldold)-f(xold));
    e = abs((xnew - xold)/xnew)*100;
    fprintf('xi = %8f\nerror = %8f%%\n',xnew,e);
    if e/100<=elimit break;
    end
    xoldold = xold;
    xold = xnew;
    i = i + 1;
end
fprintf('\nRoot is %f\n',xnew);