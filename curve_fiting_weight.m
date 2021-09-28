clear;
x = [0 2 5 7];
y = [-1 5 12 20];
w = [1 1 10 1];
d = 1; %degree of polynomial

plot(x,y,'o','MarkerFaceColor','k');
title('Curve fitting');
xlabel('x \rightarrow');
ylabel('y \rightarrow');

hold on;


n = length(x);

table = zeros(n,3*d+1);
for i = 1:2*d
    table(:,i) = w.*x.^(i);
end
for i = 1:d+1
    table(:,2*d+i) = w.*y.*x.^(i-1);
end

fprintf('Column sequence is wx wx^2...wy wyx wyx^2...\n');
disp(table);
fprintf('Summation is given in the augmented matrix\n\n');
A = zeros(d+1,d+1);
B = zeros(d+1,1);
for i = 1:d+1
    for j = 1:d+1
        A(i,j) = sum(w.*x.^(i+j-2));
    end
    B(i,1) = sum(w.*y.*x.^(i-1));
end


[m,n] = size(A);

%Check to be square
if m~=n
    disp('Matrix must be square.');
else
    aug = [A B];
    disp('Augmented Matrix: ');
    disp(aug);
    
    %For Upper Triangular Matrix
    for k = 1:n-1
               
        for i = k+1:n
            factor = aug(i,k)/aug(k,k);
            for j = k:n+1
                aug(i,j) = aug(i,j) - factor*aug(k,j);
            end
        end
        fprintf('Eliminating x%d\n',k);
        disp(aug);
    end
    % Backward subsitution
    sol = zeros(n,1);
    sol(n) = aug(n,n+1)/aug(n,n);
    for i = n-1:-1:1
        sum = 0;
        for j = i+1:n
            sum = sum + aug(i,j)*sol(j);
        end
        sol(i) = (aug(i,n+1)-sum)/aug(i,i);
    end
    
    
    

disp('x = ');

disp(sol);
end

g = @(x) polyval(sol(end:-1:1),x);
fplot(g,[min(x) max(x)],'r');
legend('Given points','Fitted curve');