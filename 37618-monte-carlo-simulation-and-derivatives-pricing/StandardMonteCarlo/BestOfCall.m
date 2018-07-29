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



function y = BestOfCall(S1,S2)
    NSim = size(S1,1);
    Nt = size(S1,2);
    A = [(S1(:,Nt)-S1(:,1))./S1(:,1) (S2(:,Nt)-S2(:,1))./S2(:,1)];
    val = [max(A,[],2) zeros(NSim,1)];
    y = mean(max(val,[],2));
end