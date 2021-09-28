a=[3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
c=[7.85; -19.3 ; 71.4];
lambda = 1.2;
elimit = 0.001;
[n,~] = size(a);
for i=1:n
    x(i)=0; xold(i)=0;
end
sum=0;
err=0;
for k=1:1000 % k is the number of iterations
    fprintf('\n\n\nIteration %d\n',k);
    for i=1:n
        for j=1:n
            if j~=i
                sum=sum+a(i,j)*x(j);
            end
        end
        x(i)=(c(i)-sum)/a(i,i);
        x(i) = lambda*(x(i)) + (1-lambda)*(xold(i));
        fprintf('\nx%d = %f\n',i,x(i));
        sum=0.0;
        err=abs((x(i)-xold(i))/x(i));
        fprintf('Error = %f%%\n',err*100);
        xold(i)=x(i);
    end
    if err<=elimit break; end
    x(i) = lambda*(x(i)) + (1-lambda)*(xold(i));
    
end
fprintf('\n\n\n');
disp('Solution');
for i=1:n disp (x(i)); end