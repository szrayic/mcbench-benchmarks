function Y = au_s(tr,X,i)
%
%  Solves shifted linear systems with the real matrix A or its 
%  transposed A':
%
%  for tr = 'N':
%
%    Y = inv(A+p(i)*I)*X;
%
%  for tr = 'T':
%
%    Y = inv(A.'+p(i)*I)*X.
%
%  The LU factors of A+p(i)*I are provided as global data. This data 
%  must be generated by calling 'au_s_i' before calling this routine!
%
%  Calling sequence:
%
%    Y = au_s(tr,X,i)
%
%  Input:
%
%    tr        (= 'N' or 'T') determines whether shifted systems with 
%              A or A' should be solved;
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

eval(lp_e( 'global LP_L',i,' LP_U',i ));

is_init1 = eval(lp_e( 'length(LP_L',i,')' ));
is_init2 = eval(lp_e( 'length(LP_U',i,')' ));
if ~is_init1 | ~is_init2
  error('This routine needs global data which must be generated by calling ''au_s_i'' first.');
end 

if tr=='N'
  eval(lp_e( 'Y = LP_U',i,'\(LP_L',i,'\X);' ));
elseif tr=='T'
  eval(lp_e( 'Y = LP_L',i,'.''\(LP_U',i,'.''\X);' ));
else
  error('tp must be either ''N'' or ''T''.');
end


