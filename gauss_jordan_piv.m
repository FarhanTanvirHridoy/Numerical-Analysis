A = [0 2 0 1;2 2 3 2;4 -3 0 1;6 1 -6 -5];
B = [0;-2;-7;6];
[m,n] = size(A);

aug = [A B];
disp('Augmented Matrix: ');
disp(aug);

%For Upper Triangular Matrix
for k = 1:n
    m = max(abs(aug([k:n],k)));
    p = find(abs(aug(k:n,k)) ==m)+k-1;
    temp=aug(p,:);
    aug(p,:)=aug(k,:);
    aug(k,:)=temp;
    fprintf('After interchanging row %d and %d\n',k,p)
    disp(aug)
    d = aug(k,k);
    aug(k,:) = aug(k,:)/d;        
    for i = 1:n
        factor = aug(i,k)/aug(k,k);
        for j = k:n+1
            if i==k
                continue;
            end
            aug(i,j) = aug(i,j) - factor*aug(k,j);
        end
    end
    fprintf('Dividing row %d by %f and eliminating x%d\n',k,d,k)
    disp(aug);
end

    
disp('Final Look');
disp(aug);
disp('x = ');
disp(aug(:,end));
