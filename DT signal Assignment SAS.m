% Define the DT signal
n = -5:5; % Time index
x = [1,3,2,4,-2,-1,-3,2,1,0,1]; % DT signal

% Plot the DT signal
figure;
stem(n, x);
title('Discrete Time Signal');
xlabel('n');
ylabel('x[n]');

% Find the Z-transform using the Symbolic Math Toolbox
syms z;
X = sum(x.*(z.^-n));

% Display the Z-transform
disp('Z-Transform:');
pretty(X);

% Calculate the Inverse Z-Transform using Partial Fraction Expansion
% Convert symbolic expression to polynomial coefficients
[num, den] = numden(X);
num = sym2poly(num);
den = sym2poly(den);

% Perform Partial Fraction Expansion
[r, p, k] = residue(num, den);

% Display the residues 'r', poles 'p', and direct terms 'k'
disp('Inverse Z-Transform:');
disp('Residues:');
disp(r);
disp('Poles:');
disp(p);
disp('Direct Terms:');
disp(k);

% Calculate the Inverse Z-Transform from the residues and poles
x_inv = zeros(size(n));
for i = 1:length(n)
    x_inv(i) = sum(r.' .* ((p.').^n(i)));
end