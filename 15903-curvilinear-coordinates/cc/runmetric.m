function [x,bco,bcn,gco,gcn,cs1,cs2] = runmetric(func)
% [x,bco,bcn,gco,gcn,cs1,cs2] = runmetric(fname)
% This program computes base vectors, metric tensor
% components,and Christoffel symbols for a curvilinear
% coordinate system defined in function func. If nargin
% is zero, the function name is read interactively.
% An example of program output appears in the text
% file runmetric.doc. The symbolic output quantities 
% x,bco,bcn,gco,gcn,cs1,vs2 are described in subfunction
% metric.
% func      - character string containing the function
%             name. If nargin is zero, the function
%             name is read interactively.
% x         - radius vector
% gco,gcn   - covariant and contravariant metric tensor
%             components   
% cs1,cs2   - Christoffel symbols of first and second
%             kinds
%
% See function metric for a full description of these
% quantities

%     by Howard Wilson, July, 2007

disp('CURVILINEAR COORDINATE SYSTEM PROPERTIES')
%disp(' ')
if nargin==0
  disp('Input the name of the function defining')
  func=input('the coordinate system > ? ','s');
end
if ischar(func)
  eval(['type ',func]); func=str2func(func);
else
  eval(['type ',func2str(func)]);
end

time=cputime;
[x,bco,bcn,gco,gcn,cs1,cs2]=metric(func,1);
time=cputime-time; disp(' ')
disp(['Computation time = ',num2str(time),' sec.'])
disp(' ')
disp('========== Program Results ==========')
disp(' ')
disp('Cartesian Radius Vector Components')
disp(x), pause(1), disp(' ')
disp('Covariant Base Vector Components')
disp(bco), pause(1), disp(' ')
disp('Contravariant Base Vector Components')
disp(bcn), pause(1), disp(' ')
disp('Covariant Metric Tensor Components')
disp(gco), pause(1), disp(' ')
disp('Contravariant Metric Tensor Components')
disp(gcn), pause(1), disp(' ')
disp('Christoffel Symbols of the First Kind')
disp(cs1), pause(1), disp(' ')
disp('Christoffel Symbols of the Second Kind')
disp(cs2), disp(' ')

% ===============================================

function [x,bco,bcn,gco,gcn,cs1,cs2]=metric(func,method)
% [x,bco,bcn,gco,gcn,cs1,cs2]=metric(func,method)

% This function computes base vectors, metric tensor
% components, and Christoffel symbols for a general
% curvilinear coordinate system
% func     - handle of a function which returns the
%            cartesian radius vector x as a function
%            of the curvilinear coordinate variables,
%            and a vector containing the names of the
%            coordinate variables used to define x. In
%            spherical coordinates, for example, names
%            might be 'r, theta, phi'.
% method   - Use 1 to compute the Christoffel symbols by
%            differentiating the metric tensor components.
%            Use 2 to compute the Christoffel symbols by 
%            by differentiating vector x. 
% x        - cartesian components of the radius vector
%            expressed in terms of the curvilinear 
%            coordinate variables
% bco, bcn - cartesian components of the covariant and
%            contravariant base vectors. The i'th column
%            of each array contains components of the 
%            i'th base vector.
% gco, gcn - covariant and contravariant components of
%            the metric tensor.
% cs1, cs2 - Christoffel symbols or the first and second
%            kinds. The symbol for index i,j,k is in
%            row i, column j, and layer k of each array.
             
%            by Howard Wilson, December 2005

if nargin<2, method=1; end
[x,t]=feval(func); x=simple(x(:)); 

% Differentiate the radius vector to get the
% contravariant base vectors.
bco=simple([diff(x,t(1)),diff(x,t(2)),diff(x,t(3))]);

% Use orthogonality to compute the contravariant 
% base vectors.
bcn=simple(inv(bco).');

% Obtain the metric tensor components as dot products of
% the base vectors
gco=simple(bco.'*bco); gcn=simple(bcn.'*bcn);

% If Christoffel symbols are not required, then exit
if nargout<6, return, end

% Compute the Christoffel symbols.
cs1=sym(zeros(3,3,3)); cs2=cs1;
if method==1   
  % Obtain symbols of the first kind by differentiating
  % the covariant metric tensor components.    
  for k=1:3
    for i=1:3, for j=1:i
      cs1(i,j,k)=1/2*(diff(gco(j,k),t(i))+...
             diff(gco(i,k),t(j))-diff(gco(i,j),t(k))); 
      if j~=i, cs1(j,i,k)=cs1(i,j,k); end   
    end, end
  end
else % method==2  
  % Obtain symbols of the first kind using derivatives 
  % of vector x.  
  h=sym(zeros(3,3,3)); 
  for k=1:3, h(:,:,k)=simple(diff(bco(:,:),t(k))); end
  for k=1:3
    cs1(:,:,k)=h(1,:,:)*bco(1,k)+h(2,:,:)*bco(2,k)+...
               h(3,:,:)*bco(3,k);
  end
  cs1=simple(cs1);
end

% Obtain Christoffel symbols of the second kind by 
% using the contravariant metric tensor components to
% raise the third index.
for k=1:3
  cs2(:,:,k)=cs1(:,:,1)*gcn(1,k)+cs1(:,:,2)*gcn(2,k)+...
             cs1(:,:,3)*gcn(3,k);
end
x=simple(x); bco=simple(bco); bcn=simple(bcn);
gco=simple(gco); gcn=simple(gcn);
cs1=simple(cs1); cs2=simple(cs2);