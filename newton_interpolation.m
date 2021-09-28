n = input('Enter order: ');
x = input('Enter x vector: ');
y = input('Enter y vector: ');

%Checking
if n+1 ~= length(x) 
    fprintf('\n\nPlease give %d points\n',n+1);
else
    xi = min(x):0.1:max(x); % points to be interpolated
    m = length(x); % size of x

    for i = 1:m
        fdd(i,1) = y(i);
    end

    for j = 2:m
        for i = 1:m-j+1
            fdd(i,j) = (fdd(i+1,j-1) - fdd(i,j-1))/(x(i+j-1) - x(i));
        end
    end
    
    %For printing Newton's interpolation polinomial
    for i=1:m
        fprintf('\nb%d = %f',i-1,fdd(1,i));
    end
    fprintf("\n\nNewton's Interpolation polynomial of order %d is\nf%d(x) = ",n,n);
    term = '';
    fprintf('%d',fdd(1,1));
    for order = 2:m
        if x(order-1)>=0 
            sign = '(x-';
        else
            sign = '(x+';
        end
        if x(order-1) == 0 term = strcat(term,'x');
        else
        term = strcat(term,sign, num2str(abs(x(order-1))),')');
        end
        if fdd(1,order) == 0
            continue;
        end
        if fdd(1,order)>=0 
            sign = '+';
        else
            sign = '-';
        end
        yint2 =  strcat(sign,num2str(abs(fdd(1,order))),term);
        fprintf('%s',yint2);
    end
    fprintf('\n');
    
    %For graphing
    for i = 1:length(xi)
        xterm = 1;
        yint(1) = fdd(1,1);
        for order = 2:m
            xterm = xterm*(xi(i) - x(order-1));
            yint(order) = yint(order - 1) + fdd(1,order)*xterm;            
        end
        yi(i) = yint(order);
    end
    plot(x,y,'ro','MarkerFaceColor','r','MarkerEdgeColor','g');
    hold on;
    plot(xi,yi,'b');
    title("Newton's Interpolation Polynomial");
    xlabel('x');
    ylabel('f(x)');
    legend('Given points','Interpolation curve');    
end