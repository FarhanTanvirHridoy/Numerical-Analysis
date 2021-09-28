A = [1 1 -1;2 3 -5; 3 2 -3];
B = [2; -3; 6];
[n,~] = size(A); 
L = zeros(n,n);
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
D = L\B;
disp('D = ');
disp(D);
x = A\D;

disp('x = ');
disp(x);