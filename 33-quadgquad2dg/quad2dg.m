function [int, tol1,k] = quad2dg(fun,xlow,xhigh,ylow,yhigh,tol,p1,p2,p3,p4,p5,p6,p7,p8,p9)
%QUAD2DG Numerically evaluates 2D integrals using Gauss quadrature.
%
%  usage: [int, tol] = quad2dg('Fun',xlow,xhigh,ylow,yhigh)
%         [int, tol] = quad2dg('Fun',xlow,xhigh,ylow,yhigh,reltol,p1,p2,...)
%
%This function is similar to QUAD or QUAD8 for 2-dimensional integration,
%but it uses a Gaussian quadrature integration scheme.  
% 	int     -- value of the integral
%        tol     -- absolute tolerance abs( int-intold)
%       Fun     -- Fun(x,y) (function to be integrated)
%       xlow    -- lower x limit of integration
%       xhigh   -- upper x limit of integration
%       ylow    -- lower y limit of integration
%       yhigh   -- upper y limit of integration
%       reltol     -- relative tolerance parameter (optional)
%
%Note that if there are discontinuities the region of integration 
%should be broken up into separate pieces.  And if there are singularities,
%a more appropriate integration quadrature should be used 
%(such as the Gauss-Chebyshev for a specific type of singularity).
%
%Example:  integration from 0 to 2 and from 2 to 4 for both x and y is done by:
%                quad2dg('(x.^2.*y)',[0 2],[2 4],[0 2],[2 4])

%modified by Per A. Brodtkorb 17.11.98 : 
% -accept multiple integrations limits
% -optimized by saving the weights as global constants and only  computing the integrals which did not converge 
%  -enabled the integration of directly given functions enclosed in
%  parenthesis 


global bpx2 bpy2 wfxy2;

if isempty(bpx2)| isempty(bpy2)| isempty(wfxy2)
  [bpx2,bpy2,wfxy2] = grule2d(2,2);
end

if exist('tol')~=1,
  tol=1e-3;
elseif isempty(tol),
  tol=1e-3;
end
%[errorcode ,xlow,xhigh,ylow,yhigh]=distchck(4,xlow,xhigh,ylow,yhigh);
[errorcode ,xlow,xhigh,ylow,yhigh]=comnsize(xlow,xhigh,ylow,yhigh);
if errorcode > 0
  error('Requires non-scalar arguments to match in size.');
end
%size(xlow),size(xhigh),  size(ylow),size(yhigh)  
%if prod(size(xlow))==1,
%  xlow=xlow(ones(size(xhigh)));;
%elseif prod(size(xhigh))==1,
%  xhigh=xhigh(ones(size(xlow)));;
%elseif any( size(xhigh)~=size(xlow) )
%  error('The input must have equal size!')
%end

[N M]=size(xlow);
%setup mapping parameters &  make sure they all are column vectors
xlow=xlow(:); xhigh=xhigh(:);ylow=ylow(:);yhigh=yhigh(:); 
nk=N*M;

%Map to x
qx=(xhigh-xlow)/2;
px=(xhigh+xlow)/2;
x=permute(qx(:,ones(1,2), ones(1,2) ),[ 2 3 1]).*bpx2(:,:,ones(1,nk)) ...
    +permute(px(:,ones(1,2), ones(1,2) ),[2 3 1]);
%Map to y
qy=(yhigh-ylow)/2;
py=(yhigh+ylow)/2;
y=permute(qy(:,ones(1,2), ones(1,2) ),[ 2 3 1]).*bpy2(:,:,ones(1,nk)) ...
    +permute(py(:,ones(1,2), ones(1,2) ),[2 3 1]);

if any(fun=='(') & any(fun=='y')& any(fun=='x'),
  exec_string=['fv=', fun, ';']; %the call function is already setup
else%set up the call function 
  exec_string=['fv=', fun, ' (x,y'];
  num_parameters=nargin-6;
  for i=1:num_parameters,
    exec_string=[exec_string,',p',int2str(i)];
  end
  exec_string=[exec_string,');'];
end
eval(exec_string);
int_old = squeeze(sum(sum(wfxy2(:,:,ones(1,nk)).*fv))).*qx.*qy;
int=zeros(size(int_old));tol1=int;
k=1:nk;

% Break out of the iteration loop for three reasons:
%  1) the last update is very small (compared to int)
%  2) the last update is very small (compared to tol)
%  3) There are more than 8 iterations. This should NEVER happen. 

converge='n';
for i=1:8,
  gnum=int2str(2^(i+1));
  eval(['global bpx',gnum,' wfxy',gnum,'  bpy',gnum,';']);
  if isempty(eval(['bpx',gnum]))| isempty(eval(['bpy',gnum])) ,  
    eval(['[bpx',gnum,',bpy',gnum,',wfxy',gnum,']=grule2d(',gnum,',', gnum,');']);
  end
  eval(['x=permute(qx(k,ones(1,',gnum,'), ones(1,',gnum,') ),[ 2 3 1]).*bpx',gnum,'(:,:,ones(1,nk)) +permute(px(k,ones(1,',gnum,'), ones(1,',gnum,') ),[2 3 1]);']);

  eval(['y=permute(qy(k,ones(1,',gnum,'), ones(1,',gnum,') ),[ 2 3 1]).*bpy',gnum,'(:,:,ones(1,nk)) +permute(py(k,ones(1,',gnum,'), ones(1,',gnum,') ),[2 3 1]);']);
    eval(exec_string);
    eval(['int(k) = squeeze(sum(sum((wfxy',gnum,'(:,:,ones(1,nk)).*fv)))).*qx(k).*qy(k);']);
    tol1(k)=abs(int_old(k)-int(k)); % absolute tolerance
    k=find(tol1 > abs(tol*int)|tol1 > abs(tol));%indices to integrals which did not converge
  
    if any(k), % compute integrals again
      nk=length(k);%# of integrals we have to compute again
    else
      converge='y';
      break;
    end
    
     int_old(k)=int(k);
end
int=reshape(int,[N M]); % reshape int to the same size as input arguments
if converge=='n',
  disp('Integral did not converge--singularity likely')
end



function [bpx,bpy,wfxy] = grule2d (nquadx,nquady)
%usage:  [bpx,bpy,wfxy] = grule2d (nquadx,nquady);
 
[bpxv,wfxv]=grule(nquadx);
[bpyv,wfyv]=grule(nquady);
[bpx,bpy]=meshgrid(bpxv,bpyv);
[wfx,wfy]=meshgrid(wfxv,wfyv);
wfxy=wfx.*wfy;
 
return
function [bp,wf] = grule1(n)
wfun = 1;
wtxt = sprintf('%d_%d',n,wfun); % # of weights and weight function used
cbtxt = sprintf('cb%s',wtxt); %base points string
cwtxt = sprintf('cw%s',wtxt); %weights string
eval(sprintf('global %s %s ;',cbtxt,cwtxt));
if isempty(eval(cbtxt)),  
  % calculate the weights if necessary
  eval(sprintf('[%s,%s]=grule(gn);',cbtxt,cwtxt));
end
eval(sprintf('bp= %s; wf = %s;',cbtxt,cwtxt));
return
function [bp,wf]=grule(n)
%GRULE  computes base points and weight factors for a Gauss-
%       Legendre quadrature.
%
%CALL    [bp, wf]=grule(n);
% 
%   bp = base points
%   wf = weight factors
%   n  = number of base points (integrates a (2n-1)th order
%        polynomial exactly)
% 
%   The Gauss-Legendre quadrature integrates an integral of the form
%        1                 n
%       Int (f(x)) dx  =  Sum  wf_j*f(bp_j)
%       -1                j=1
%   See also: quadg.

%Reference
% Davis and Rabinowitz in 'Methods of Numerical Integration', page 365,
% Academic Press, 1975.

% Revised GKS 5 June 92
% Revised Per A. Brodtkorb pab@marin.ntnu.no 30.03.1999

% [bp,wf]=grule(n)
%  This function computes Gauss base points and weight factors
%  using the algorithm given by Davis and Rabinowitz in 'Methods
%  of Numerical Integration', page 365, Academic Press, 1975.

 
  
  
  bp=zeros(n,1); wf=bp; iter=2; m=fix((n+1)/2); e1=n*(n+1);
mm=4*m-1; t=(pi/(4*n+2))*(3:4:mm); nn=(1-(1-1/n)/(8*n*n));
xo=nn*cos(t);
for j=1:iter
   pkm1=1; pk=xo;
   for k=2:n
      t1=xo.*pk; pkp1=t1-pkm1-(t1-pkm1)/k+t1;
      pkm1=pk; pk=pkp1;
   end
   den=1.-xo.*xo; d1=n*(pkm1-xo.*pk); dpn=d1./den;
   d2pn=(2.*xo.*dpn-e1.*pk)./den;
   d3pn=(4*xo.*d2pn+(2-e1).*dpn)./den;
   d4pn=(6*xo.*d3pn+(6-e1).*d2pn)./den;
   u=pk./dpn; v=d2pn./dpn;
   h=-u.*(1+(.5*u).*(v+u.*(v.*v-u.*d3pn./(3*dpn))));
   p=pk+h.*(dpn+(.5*h).*(d2pn+(h/3).*(d3pn+.25*h.*d4pn)));
   dp=dpn+h.*(d2pn+(.5*h).*(d3pn+h.*d4pn/3));
   h=h-p./dp; xo=xo+h;
end
bp=-xo-h;
fx=d1-h.*e1.*(pk+(h/2).*(dpn+(h/3).*(...
    d2pn+(h/4).*(d3pn+(.2*h).*d4pn))));
wf=2*(1-bp.^2)./(fx.*fx);
if (m+m) > n, bp(m)=0; end
if ~((m+m) == n), m=m-1; end
jj=1:m; n1j=(n+1-jj); bp(n1j)=-bp(jj); wf(n1j)=wf(jj);
% end
