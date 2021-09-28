%User Input
A=[4,1,2;1,3,1;1,2,5];
B=[16;10;12];
[m,n] = size(A);

aug = [A B];
disp('Augmented Matrix: ');
disp(aug);

fprintf('For Upper Triangular Matrix\n');
for k = 1:n
    d = aug(k,k);
    aug(k,:) = aug(k,:)/d;        
    for i = k+1:n
        factor = aug(i,k)/aug(k,k);
        for j = k:n+1
            aug(i,j) = aug(i,j) - factor*aug(k,j);
        end
    end
    disp(aug);
end

fprintf('For Lower Triangular Matrix\n');
for k = 1:n
    for i = 1:k-1
        factor = aug(i,k)/aug(k,k);
        for j = k:n+1
            aug(i,j) = aug(i,j) - factor*aug(k,j);
        end          
    end
    disp(aug);
end
    
disp('Final Look');
disp(aug);
disp('x = ');
disp(aug(:,end));