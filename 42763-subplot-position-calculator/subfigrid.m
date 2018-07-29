function pos = subfigrid(nrows,ncols,offset,scale)
% Create axis positions for subfigures
% 
%   pos = subfigrid(nrows,ncols)
%   pos = subfigrid(nrows,ncols,offset)
%   pos = subfigrid(nrows,ncols,offset,scale)
% 
%   The spacing of axes using the subplot command can be
%   quite large, and manipulating axis positions after
%   plotting can be tricky. For publication quality
%   graphics, it is better to specify the subplot position
%   directly, rather than using subplot indices. For
%   example:
% 
%   figure
%   subplot('position',[0.1 0.1 0.2 0.2])
%   plot(rand(20,1))
% 
%   This function creates appropriate position vectors, for
%   use in the above scenario, based on the number of
%   subplots required. Optional scaling and offset
%   parameters allow the size of each subplot to be
%   fine-tuned, and space for axis labels to be allotted.
%   All calculations are performed in normalized units.
% 
%   pos = subfigrid(nrows,ncols) creates an array of
%   positions for positioning axes as subfigures. The array
%   has dimensions [m,p,n]: m is the subplot row, n is the
%   subplot column, and p is the position vector. By
%   default, each axis will be scaled such that [width
%   height] will be [1/ncols 1/nrows].
%   
%   pos = subfigrid(nrows,ncols,offset) allows a margin
%   offset to be specified. This should be a four-element
%   vector specifying the margins thus: [left right top
%   bottom]. By default offset=[0 0 0 0]. Axes will be
%   scaled to fill the remaining space.
% 
%   pos = subfigrid(nrows,ncols,offset,scale) allows the
%   axes to be scaled. This should be a two-element vector
%   specifying a scale factor that will be applied to each
%   axis; scale(1) scales the width, scale(2) scales the
%   height. The axes will be scaled such that the offset
%   margin will be retained. By default scale=[1 1].
% 
%   If scaling is required, but an offset is not, offset may
%   be set to the empty matrix [].
% 
%   Examples
% 
%       Ex. 1
%       % Normal use of subfigrid
%       scrsz = get(0,'ScreenSize');
%       nrows = 2;
%       ncols = 3;
%       pos = subfigrid(nrows,ncols,...
%           [0.05 0.01 0.01 0.05],[0.85 0.88]);
% 
%       figure('units','pixels','position',...
%           [scrsz(3)/4,scrsz(4)/4,scrsz(3)/2,scrsz(4)/2])
%       for m = 1:nrows
%           for n = 1:ncols
%               subplot('position',pos(m,:,n))
%               plot(randn(20,1))
%           end
%       end
% 
%       Ex. 2
%       % Use ind2sub when row/col indices are not available
%       scrsz = get(0,'ScreenSize');
%       nrows = 2;
%       ncols = 3;
%       pos = subfigrid(nrows,ncols,...
%           [0.05 0.01 0.01 0.05],[0.85 0.88]);
% 
%       figure('units','pixels','position',...
%           [scrsz(3)/4,scrsz(4)/4,scrsz(3)/2,scrsz(4)/2])
%       for p = 1:nrows*ncols
%           [m,n] = ind2sub([nrows ncols],p);
%           subplot('position',pos(m,:,n))
%           plot(randn(20,1))
%       end
% 
%   See also SUBPLOT.

% !---
% ==========================================================
% Last changed:     $Date: 2012-10-28 13:03:16 +0000 (Sun, 28 Oct 2012) $
% Last committed:   $Revision: 212 $
% Last changed by:  $Author: ch0022 $
% ==========================================================
% !---

%% parse inputs

if nargin<3
    offset = [];
end
if nargin<4
    scale = [];
end

assert(isscalar(nrows) & round(nrows)==nrows,'nrows must be a whole number scalar')
assert(isscalar(ncols) & round(ncols)==ncols,'ncols must be a whole number scalar')
assert(nrows>=1 & ncols>=1,'nrows and ncols must be greater than, or equal to, 1.')

if isempty(offset)
    offset = zeros(1,4);
elseif ~(isnumeric(offset) && numel(offset)==4)
    error('offset should be a four-element numeric vector')
elseif any(offset<0)
    error('offset should not contain any negative values')
else
    offset = offset(:)';
end

if isempty(scale)
    scale = [1 1];
elseif ~(isnumeric(scale) && numel(scale)==2)
    error('scale should be a two-element numeric vector')
elseif any(scale>1) || any(scale<0)
    error('scale values should be in the range [0,1]')
else
    scale = scale(:)';
end

%% calculate positions

% ignore scale values for dimensions where there is one unit.
if ncols==1 && scale(1)<1
    scale(1) = 1;
    disp('subfigrid: Since there is only one column, scale(1) has no effect (and is consequently set to 1).')
end
if nrows==1 && scale(2)<1
    scale(2) = 1;
    disp('subfigrid: Since there is only one row, scale(2) has no effect (and is consequently set to 1).')
end

% calculate array of left positions
sub_pos_l = linspace(offset(1),1-offset(2),ncols+1);
width = min(abs(diff(sub_pos_l)))*scale(1);
sub_pos_l = sub_pos_l(1:end-1);
% shift axes to maintain right margin:
sub_pos_l = sub_pos_l+linspace(0,((1-scale(1))*width),ncols);

% calculate array of bottom positions
sub_pos_b = linspace(1-offset(3),offset(4),nrows+1);
height = min(abs(diff(sub_pos_b)))*scale(2);
sub_pos_b = sub_pos_b(2:end);
% shift axes to maintain top margin:
sub_pos_b = sub_pos_b+linspace(((1-scale(2))*height),0,nrows);

% create array of positions
pos = zeros(nrows,4,ncols);
for m = 1:nrows
    for n = 1:ncols
        pos(m,1,n) = sub_pos_l(n); % left
        pos(m,2,n) = sub_pos_b(m); % bottom
    end
end
pos(:,3,:) = width;
pos(:,4,:) = height;

% [EOF]
