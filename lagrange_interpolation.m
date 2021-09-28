x = [0 1 2 3 4];
y = [0 1 8 27 64];
n = length(x) - 1; % Order

fprintf('f%d(x) = ',n);
for i = 1:n+1
    if i==1 fprintf('L0f(x0)');
    else fprintf(' + L%df(x%d)',i-1,i-1);
    end
end

fprintf('\nf%d(x) = ',n);
for i = 1:n+1
    if y(i)>=0 sign = '+';
    else sign = '-'; end
    if i==1 fprintf('%d*L0',y(i));
    else fprintf(' %s %d*L%d',sign,y(i),i-1);
    end
end

for i=1:n+1
    fprintf('\n\nL%d = \n',i-1);
    d(i) = 1;
    for j = 1:n+1
        if x(j)>=0 sign = '-';
        else sign = '+'; end
        if j ~= i
            fprintf('(x %s %d)',sign,x(j));
        end
    end
    fprintf('\n-------------------------------\n');
    for j = 1:n+1
        if j ~= i
            fprintf('(%d %s %d)',x(i),sign,x(j));
            d(i) = d(i)*(x(i) - x(j));
            
        end
    end
    fprintf('\t\t = %d\t[value of denominator]',d(i));
end
fprintf('\n\nNow its your time\n');

xi = min(x):0.1:max(x);

for k = 1:length(xi)
    sum = 0;
    for i = 1:n+1
        L = 1;
        for j=1:n+1
            if j ~= i
                L = L*(xi(k) - x(j))/(x(i) - x(j));
            end
        end
        sum = sum + L*y(i);
    end
    yi(k) = sum;
end
plot(x,y,'ro','MarkerFaceColor','r','MarkerEdgeColor','g');
hold on;
plot(xi,yi,'b');
title('Lagranges Interpolation Polynomial');
xlabel('x');
ylabel('f(x)');
legend('Given points','Interpolation curve');