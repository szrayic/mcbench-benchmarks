function Y = as_m(tr,X)
%
%  Evaluates matrix-matrix products with the real, symmetric matrix A, 
%  i.e., Y = A*X.
%
%  A is provided as global data. This data must be generated by calling
%  'as_m_i' before calling this routine!
%  
%  If called without input parameters, this routine returns the order of
%  the matrix A.
%
%  Calling sequence:
%
%    Y = as_m(tr,X)
%    n = as_m
%
%  Input:
%
%    tr        is not referenced;
%    X         a matrix of proper size.
%
%  Output:
%
%    Y         the resulting product;
%    n         the order of the matrix A.
%
%
%  LYAPACK 1.0 (Thilo Penzl, May 1999)

ni = nargin;

if ni~=2 & ni~=0
  error('Wrong number of input arguments.');
end

global LP_A

if ~length(LP_A)
  error('This routine needs global data which must be generated by calling ''as_m_i'' first.');
end 

if ni==0
  Y = size(LP_A,1);  
else
  Y = LP_A*X;
end


