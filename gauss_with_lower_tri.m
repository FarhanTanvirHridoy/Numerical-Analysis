%User Input
A=[4,1,2;1,3,1;1,2,5]; % Coefficient matrix
B=[16;10;12]; % RHS vector
[m,n] = size(A);

%Check to be square
if m~=n
    disp('Matrix must be square.');
else
    aug = [A B];
    disp('Augmented Matrix: ');
    disp(aug);
    
    % Lower triangular matrix
    for k = n:-1:1                
        for i = k-1:-1:1
            factor = aug(i,k)/aug(k,k);
            for j = n+1:-1:1
                aug(i,j) = aug(i,j) - factor*aug(k,j);
            end
        end
    end
    disp('Lower triangular matrix:');
    disp(aug);
    
    % Forward subsitution
    x = zeros(n,1);
    x(1) = aug(1,n+1)/aug(1,1);
    for i = 2:n
        sum = 0;
        for j = 1:i-1
            sum = sum + aug(i,j)*x(j);
        end
        x(i) = (aug(i,n+1)-sum)/aug(i,i);
    end
    disp('x = ');
    disp(x);   
end