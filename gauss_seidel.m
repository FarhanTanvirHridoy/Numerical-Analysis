a=[4 1 -1; -2 5 0; 2 1 6];
c=[1 -7 13];
elimit = 0.0001;
[n,~] = size(a);
x = [0 1 1];
xold = [0 1 1];
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
        fprintf('\nx%d = %f\n',i,x(i));
        sum=0.0;
        err=abs((x(i)-xold(i))/x(i));
        fprintf('Error = %f%%\n',err*100);
        xold(i)=x(i);
    end
    if err<=elimit break; end
    
end
fprintf('\n\n\n');
disp('Solution');
for i=1:n disp (x(i)); end