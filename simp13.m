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
fprintf('I = h/3*[f1 + 4(f2 + f4 +...) + 2(f3 + f5 +...) + f%d]\n\n',n+1);
s = 0;
for k = 1:(n/2)
    s = s + f(a + h*(2*k-2)) + 4*f(a+h*(2*k-1))+f(a+h*2*k);
end
I = h*s/3;
disp('Result is');
disp(I);