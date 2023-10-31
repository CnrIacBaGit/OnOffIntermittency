function [X,Y] = compute_r_varying(r,R,k,T)

% Compute X and Y 
% r randomically varying

% Parameters
a = 0.7;
b = a;
N = rand;
P = rand;
c = 1;


% Initial values
X0 = a*b*N; 
Y0 = a*P; 
Xout = [];
Yout = [];

% Time steps
% T = 10^6;

X = X0;
Y = Y0;
for i = 1 : T
    rr = rand;
    rt(i) = r+(R-r)*rr;
    X1 = X*exp(rt(i)*(1-X/k)-c*Y); 
    Y = X*(1-exp(-Y));
    X = X1;
    Xout = [Xout,X1];
    Yout = [Yout,Y];
end


kurt_x = kurtosis(Xout); 
kurt_y = kurtosis(Yout);

clear X Y
X = Xout;
Y = Yout;

