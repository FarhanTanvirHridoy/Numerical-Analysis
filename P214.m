Tv = input('Tv: ');
Tw = input('Tw: ');
d = input('d: ');
T_given = 100:10:250;
phi_given = [0.481 0.536 0.606 0.670 0.748 0.820 0.892... 
    0.976 1.051 1.130 1.218 1.280 1.327 1.376 1.430 1.503];
disp('Tv =');disp(Tv);
disp('Tw =');disp(Tw);
disp('d =');disp(d);
%Calculating I
I = 0;
beta = linspace(0,pi,101);
h = pi/100;
f = (sin(beta)).^(1/3);
for i = 1:2:99
    I = I + h/3*(f(i) + 4*f(i+1) + f(i+2));
end
disp('I = ');
disp(I);
%Finding phi
T = (Tv + Tw)/2;
disp('Mean Temperature, T ='); disp(T);
T1 = floor(T/10)*10;
T2 = T1 + 10;
phi1 = phi_given(find(T1 == T_given));
phi2 = phi_given(find(T2 == T_given));
phi = (phi2-phi1)/(T2-T1)*(T-T1)+phi1;
disp('phi ='); disp(phi*10^14);
%Calculating h
h = (phi*10^14/((d/24)*(Tv - Tw)))^(1/4)*2^(3/2)/(3*pi)*I^(3/4);
disp('Heat transfer coefficient, h ='); disp(h);