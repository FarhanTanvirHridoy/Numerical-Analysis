f = @(x) (sin(x))^2 + (cos(x))^3; %Given function
n = 12; %number of divisions
a = 2; %lower bound
b = 9; %upper bound
h = (b-a)/n;
fprintf('\nh = %f\n\n',h);
for i = 0:n
    fprintf('f%d = f(%f) = %f\n',i+1,a+i*h,f(a+i*h));
end
fprintf('\nNow its your time\nApply formula from bappy sir slide\n\n');
fprintf('I = 3h/8*[f1 + 3(f2 + f3 + f5 + f6 +...) + 2(f4 + f7 + f10 +...) + f%d]\n\n',n+1);
s = 0;
for k = 1:(n/3)
    s = s + f(a + h*(3*k-3)) + 3*f(a + h*(3*k-2))+ 3*f(a + h*(3*k-1))...
        +f(a+h*3*k);
end
I = 3*h*s/8;
disp('Result is');
disp(I);