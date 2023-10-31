function [X,Y] = compute_delta_varying(d,D,T)
% Compute X and Y 
% delta randomically varying

% Parameters
a = 0.7;
b = a;
r = 3;
k = 0.49;
c = 1;

% Initial values
X0 = rand;
Y0 = rand;
Xout = [];
Yout = [];


% Time steps
% T = 10^6;

X = X0;
Y = Y0;
for i = 1 : T
    dd = rand;
    delta(i) = d+(D-d)*dd;
    X1 = delta(i)*X*exp(r*(1-X/k)-c*Y);
    Y = X*(1-exp(-Y));
    X = X1;
    Xout=[Xout,X1];
    Yout=[Yout,Y];
end


kurt_x = kurtosis(Xout);
kurt_y = kurtosis(Yout);

clear X Y
X = Xout;
Y = Yout;

