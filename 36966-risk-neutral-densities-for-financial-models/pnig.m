% This is material illustrating the methods from the book
% Financial Modelling  - Theory, Implementation and Practice with Matlab
% source
% Wiley Finance Series
% ISBN 978-0-470-74489-5
%
% Date: 02.05.2012
%
% Authors:  Joerg Kienitz
%           Daniel Wetterau
%
% Please send comments, suggestions, bugs, code etc. to
% kienitzwetterau_FinModelling@gmx.de
%
% (C) Joerg Kienitz, Daniel Wetterau
% 
% Since this piece of code is distributed via the mathworks file-exchange
% it is covered by the BSD license 
%
% This code is being provided solely for information and general 
% illustrative purposes. The authors will not be responsible for the 
% consequences of reliance upon using the code or for numbers produced 
% from using the code. 



function p = pnig(xnew, xold, t, r, alpha, beta, delta)
% probability distribution of the NIG model
d = delta * t;                          % time dependent parameter

gamma = sqrt(alpha^2 - beta^2);

% martingale correction removes the drift!
omega = delta * gamma - delta*sqrt(alpha^2-(1+beta)^2); % martingale correction

x = xnew -xold - (r - omega) * t;           % 
arg = sqrt(1+(x./delta).^2);

p = real(alpha / pi * besselk(1,alpha .* d .* arg)./arg.* exp(d.*(gamma+beta.*(x./d))));
end