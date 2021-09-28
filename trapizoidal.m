f = @(x) (sin(x))^2 + (cos(x))^3; %Given function
n = 10; %number of divisions
a = 2; %lower bound
b = 9; %upper bound
h = (b-a)/n;
fprintf('\nh = %f\n\n',h);
for i = 0:n
    fprintf('f%d = f(%f) = %f\n',i+1,a+i*h,f(a+i*h));
end
fprintf('\nNow its your time\nApply formula from bappy sir slide\n\n');
fprintf('I = h/2*[f1 + 2(f2 + f3 + f4 +.....) + f%d]\n\n',n+1);
s = 0;
for k = 1:n
    s = s + f(a + h*(k-1)) + f(a + h*k);
end
I = h*s/2;
disp('Result is');
disp(I);