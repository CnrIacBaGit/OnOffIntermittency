clear all
% Compute X
prompt = "Variable varying? r/delta";
txt = input(prompt,"s");

% Time steps
T = 10^4;

if txt == 'r' % r randomically varying
    % Parameters
    k = 0.49;
    r = 1.508;
    R = 2.6;
    [X,Y] = compute_r_varying(r,R,k,T);
else % delta randomically varying
    % Parameters
    d = 0.0025701;
    D = 0.2;
    [X,Y] = compute_delta_varying(d,D,T);
end

% Power spectral density
X_star = mean(X);
X2 = abs(X-X_star);

[pxx,fx] = pwelch(X2);
figure
loglog(fx,pxx)
xlabel('Frequency (Hz)')
title('Power spectral density')

% Probability density
prob = distribution_off_phases(X);

figure
loglog(prob)
hold on
loglog([1:10^3].^(-3/2))
xlabel('Duration')
title('Probability density')