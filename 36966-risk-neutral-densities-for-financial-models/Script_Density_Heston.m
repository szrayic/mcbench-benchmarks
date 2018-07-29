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



% Script chap::2::script
% Density heston Model
%
%   uses the characteristic function of the heston model
%
t = 10;                             % maturity
a = 600;                            % spot value
N = 512;                            % number of grid points  
x = ( (0:N-1) - N/2 ) / a;          % range

figname = 'Risk Neutral Density - Heston';

vInst = 0.02;                  % instantanuous variance of base parameter set  
vLong = 0.02;                  % long term variance of base parameter set
kappa = 0.1;                   % mean reversion speed of variance of base parameter set
omega = 0.2;                   % volatility of variance of base parameter set
rho = 0;                       % correlation of base parameter set


% cf (characteristic function) for the heston model
f = @(x) cf_heston(x,vInst,vLong,kappa,omega,rho,t,0);

legendname = 'Base parameter set';
y = fftdensity(f,a,N);         % density calculated from cf for base parameter set
%% Changing vInst
vInst_low = .01;                    % changing parameter (low value)
vInst_high = .04;                   % changing parameter (high value)

f_low = @(x) cf_heston(x,vInst_low,vLong,kappa,omega,rho,t,0);
f_high = @(x)  cf_heston(x,vInst_high,vLong,kappa,omega,rho,t,0);

y_low = fftdensity(f_low,a,N);
y_high = fftdensity(f_high,a,N);

legendname_low = 'Changing V(0) low value';
legendname_high = 'Changing V(0) high value';

% output density as figure
createfigure_density(x,y,y_low,y_high,...
    figname, legendname,legendname_low,legendname_high);
%% Changing vLong
vLong_low = .01;
vLong_high = .04;

f_low =  @(x) cf_heston(x,vInst,vLong_low,kappa,omega,rho,t,0);
f_high =  @(x) cf_heston(x,vInst,vLong_high,kappa,omega,rho,t,0);

y_low = fftdensity(f_low,a,N);
y_high = fftdensity(f_high,a,N);

legendname_low = 'Changing \Theta low value';
legendname_high = 'Changing \Theta high value';

createfigure_density(x,y,y_low,y_high,...
    figname, legendname,legendname_low,legendname_high);

%% Changing kappa
kappa_low = .05;
kappa_high = .5;

f_low = @(x)  cf_heston(x,vInst,vLong,kappa_low,omega,rho,t,0);
f_high = @(x)  cf_heston(x,vInst,vLong,kappa_high,omega,rho,t,0);

y_low = fftdensity(f_low,a,N);
y_high = fftdensity(f_high,a,N);

legendname_low = 'Changing \kappa low value';
legendname_high = 'Changing \kappa high value';

createfigure_density(x,y,y_low,y_high,...
    figname, legendname,legendname_low,legendname_high);
%% Changing omega
omega_low = .1;
omega_high = .3;

f_low = @(x)  cf_heston(x,vInst,vLong,kappa,omega_low,rho,t,0);
f_high =  @(x) cf_heston(x,vInst,vLong,kappa,omega_high,rho,t,0);


y_low = fftdensity(f_low,a,N);
y_high = fftdensity(f_high,a,N);

legendname_low = 'Changing \nu low value';
legendname_high = 'Changing \nu high value';

createfigure_density(x,y,y_low,y_high,...
    figname, legendname,legendname_low,legendname_high);
%% Changing delta
rho_low = -.8;
rho_high = .8;

f_low =  @(x) cf_heston(x,vInst,vLong,kappa,omega,rho_low,t,0);
f_high =  @(x) cf_heston(x,vInst,vLong,kappa,omega,rho_high,t,0);

y_low = fftdensity(f_low,a,N);
y_high = fftdensity(f_high,a,N);

legendname_low = 'Changing \rho low value';
legendname_high = 'Changing \rho high value';

createfigure_density(x,y,y_low,y_high,...
    figname, legendname,legendname_low,legendname_high);


clear; clc;
