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
% Density CEV Model

t = 2;                                      % maturity
f0 = 100;                                  % spot value

figname = 'Risk Neutral Density - DD';
stepsize = 0.001;
x = 0:1:200;                            % range

sigma_base = 0.2;                        % volatility base scenario
a_base = 0.5;                            % CEV exponent base scenario

y_base = pdd(t,x,f0,sigma_base, a_base);
legendname_base = 'Base';
%% Changing sigma_base
sigma_low = 0.15;
sigma_high = 0.25;

y_low = pdd(t,x,f0,sigma_low, a_base);
y_high = pdd(t,x,f0,sigma_high, a_base);

legendname_low = 'Changing \sigma low value';
legendname_high = 'Changing \sigma high value';

createfigure_density(x,y_base,y_low,y_high,...
    figname, legendname_base,legendname_low,legendname_high);

%% Changing a_base
a_low = .1;
a_high = .9;

y_low = pdd(t,x,f0,sigma_base, a_low);
y_high = pdd(t,x,f0,sigma_base, a_high);

legendname_low = 'Changing a low value';
legendname_high = 'Changing a high value';

createfigure_density(x,y_base,y_low,y_high,...
    figname, legendname_base,legendname_low,legendname_high);
