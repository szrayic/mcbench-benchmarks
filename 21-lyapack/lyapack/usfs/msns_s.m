function Y = msns_s(tr,X,i)
%
%  Solves shifted linear systems with the symmetric, negative definite 
%  matrix A, i.e., Y = inv(A+p(i)*I)*X.
%
%  A+p(i)*I is given implicitely in a factored form. The factores are
%  provided as global data. These data must be generated by calling
%  'msns_m_i' AND 'msns_s_i' before calling this routine!
%  
%  Calling sequence:
%
%    Y = msns_s(tr,X,i)
%
%  Input:
%
%    tr        is not referenced;
%    X         a matrix of proper size;
%    i         the index of the shift parameter.
%
%  Output:
%
%    Y         the resulting solution matrix.
%  
%
%   LYAPACK 1.0 (Thilo Penzl, May 1999)

if nargin~=3
  error('Wrong number of input arguments.');
end

global LP_MU

if ~length(LP_MU)
  error('This routine needs global data which must be generated by calling ''msns_m_i'' first.');
end 

eval(lp_e( 'global LP_U',i ));

is_init = eval(lp_e( 'length(LP_U',i,')' ));
if ~is_init
  error('This routine needs global data which must be generated by calling ''msns_s_i'' first.');
end 

eval(lp_e( 'Y = -LP_MU*(LP_U',i,'\(LP_U',i,'''\(LP_MU''*X)));' ));     
                                                           % Note the minus!



