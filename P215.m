m = input('m: ');
T1 = input('T1: ');
T2 = input('T2: ');
Ts = input('Ts: ');
D = input('D: ');
%Converting unit of D in ft
D = D/12;
T = (T1 + T2)/2;
option = input('Choose Fluid:\n1. Carbon Dioxide\n2. Ethelene Glycol\nOption: ');
if option == 1
    %These are functions
    cp = @(T) 0.251 + 3.46*10^(-5)-14400/(T+460)^2;
    P = polyfit([32 212 392 572],[0.0085 0.0133 0.0181 0.0228],1);
    % k vs T looks like a straight line
    k = @(T) polyval(P,T);
    meu = @(T) 0.0332*((T+460)/460)^0.935;
elseif option == 2
    %These are functions
    cp = @(T) 0.53+0.00065*T;
    k = @(T) 0.153;
    P = polyfit(0:50:200,log([242 82.1 30.5 12.6 5.57]),1);
    % ln(meu) vs T looks like a straight line
    meu = @(T) exp(polyval(P,T));
end
h = @(T) 0.023*k(T)/D*(4*m/(pi*D*meu(T)))^0.8*(meu(T)*cp(T)/k(T))^0.4;
I = 0;
H = (T2-T1)/100;
f = @(T) cp(T)/(h(T)*(Ts - T)); % f in integrating function
%Simpson's 1/3rd rule
for i = 1:50
    I = I + H/3*(f(T1+H*(2*i-2)) + 4*f(T1+H*(2*i-1)) + f(T1+H*(2*i)));
end
L = m*I/(pi*D);
disp('Exact Required Exchanger Length, L (ft) =');
disp(L);
%For Assumed value
cp1 = cp(T);
h1 = h(T);
g = @(T) cp1/(h1*(Ts - T)); %Here cp, meu & k are constant
%Simpson's 1/3rd rule
I = 0;
for i = 1:50
    I = I + H/3*(g(T1+H*(2*i-2)) + 4*g(T1+H*(2*i-1)) + g(T1+H*(2*i)));
end
L1 = m*I/(pi*D);
disp('Assumed Required Exchanger Length, L (ft) =');
disp(L1);
%Calculating error
error = abs(L1-L)/L*100;
disp('Percentage of error: ');
disp(error);