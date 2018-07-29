function [xc] = Zeros_finding(y,x)
% This function is used to recognize the zero crossing points of an y=f(x)
% function. 
% This function was already written in one of the answers of matlab zeros
% crossing discusions.
% This function inputs are the x & y- axes values of an signal.
% Only written and not developed by: Aubai Alkhatib  date: 2013
n = length(y);
  ind = 1:(n-1);

  % list of intervals with a zero crossing
  k = find(((y(ind)<=0) & (y(ind+1)>0)) | ...
           ((y(ind)>=0) & (y(ind+1)<0)));
  
  % list of zero crossings
  xc = [];
  
  % intervals where y is zero at both ends of the
  % interval are exactly zero are indeterminate.
  % the solution may be anywhere on that interval.
  % I'll choose to return both endpoints of the
  % interval.
  L = (y(k)==0) & (y(k+1)==0);
  if any(L) 
    xc = x(k(L));
    k(L)=[];
  end

  % interpolate to find x. I've already removed
  % the constant intervals at zero
  if ~isempty(k)
    s = (y(k+1)-y(k))./(x(k+1)-x(k));
    xc = [xc,x(k) - y(k)./s];
  end

  % patch for last element exactly zero
  if y(end)==0
   xc(end+1) = x(end);
  end
  if xc(1) == 0
  xc = xc(2:end);
  end
end

