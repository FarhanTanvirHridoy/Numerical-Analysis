A = [1 -1 2;3 0 1;1 0 2];
[n,~] = size(A);
B = eye(n);
L = zeros(n,n);
x = zeros(n);
L(n,n) = 1;
disp('U = ');
for k = 1:n-1    
    L(k,k) = 1;
    for i = k+1:n
        factor = A(i,k)/A(k,k);
        L(i,k) = factor;
        
        for j = k:n
            A(i,j) = A(i,j) - factor*A(k,j);
            
        end
        
    end
    disp(A);
    
end
disp('L = ');
    disp(L);
for j = 1:n
    
    D = L\B(:,j);
    disp('D = ');
    disp(D);
    x(:,j) = A\D;
    disp('inv(A) = ');
    disp(x);
end
