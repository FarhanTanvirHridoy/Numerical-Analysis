f = @(x) (sin(x))^2 + (cos(x))^3; %Given function
n = 11; %number of divisions
a = 2; %lower bound
b = 9; %upper bound
h = (b-a)/n;
fprintf('\nh = %f\n\n',h);
fprintf('For 1/3rd\n\n');
p = 8; % for simpson's 1/3
for i = 0:p
    fprintf('f%d = f(%f) = %f\n',i+1,a+i*h,f(a+i*h));
end
fprintf('\nApply formula from bappy sir slide\n');
s1 = 0;
for k = 1:(p/2)
    s1 = s1 + f(a + h*(2*k-2)) + 4*f(a+h*(2*k-1))+f(a+h*2*k);
end
I1 = h*s1/3; % result for 1/3
fprintf('I1 = %f\n\n',I1);
fprintf('For 3/8th\n\n');
q = n-p; % for simpson's 3/8
for i = p:n
    fprintf('f%d = f(%f) = %f\n',i+1,a+i*h,f(a+i*h));
end
fprintf('\nApply formula from bappy sir slide\n');
s2 = 0;
d=a+p*h; % starting point for 3/8
for k = 1:(q/3)
    s2 = s2 + f(d + h*(3*k-3)) + 3*f(d+h*(3*k-2))+ 3*f(d+h*(3*k-1))...
    +f(d+h*3*k); 
end
I2 = 3*h*s2/8; % result for 3/8
fprintf('I2 = %f\n\n',I2);
I = I1 + I2;
fprintf('\nFinally I = \n');
disp(I);