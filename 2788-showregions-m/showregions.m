function showregions(L,n)
%SHOWREGIONS Display selected regions of a label matrix.
%   SHOWREGIONS(L,N) displays the regions of the label matrix L
%   corresponding to the indices listed in the vector N.  L is a
%   label matrix generated by the functions BWLABEL or WATERSHED,
%   and N is a vector of indices (positive integers, and zero).
%
%   Example:
%
%       Begin by segmenting the grains of rice in the sample image
%       'rice.png' (following the method used in the Image Processing
%       Toolbox demo IPEXRICE).
%
%           I = imread('rice.png');
%           background = imopen(I,strel('disk',15));
%           I2 = imsubtract(I,background);
%           I3 = imadjust(I2);
%           threshold = graythresh(I3);
%           bw = im2bw(I3,threshold);
%           [labeled,numObjects] = bwlabel(bw,4);
%
%       Now identify every fourth region in the 'labeled' matrix
%       using SHOWREGIONS:
%
%           showregions(labeled,1:4:numObjects)
%
%       See also BWLABEL, WATERSHED, REGIONPROPS.

%   Paul Fricker 10/12/2006

if ( ~isa(L,'double') || ~isposints(L(:)) )
    error('SHOWREGIONS:error_label', ...
          'L must be a label matrix (returned by BWLABEL or WATERSHED).')
end

if ~isposints(n)
    error('SHOWREGIONS:error_posint', ...
          'All the indices in N must be positive integers.')
end

nums = unique(L);
n = n(:);  % NOTE: N does not actually have to be a vector, as the DOC says.
n_ismember = ismember(n,nums);

if ( any(n_ismember) && ~all(n_ismember) )
    warning('SHOWREGIONS:warn_some', ...
            'Some of the requested regions were not found in the image.')
elseif all(~n_ismember)
    error('SHOWREGIONS:error_none', ...
          'None of the requested regions were found in the image.')
end
n = n(n_ismember);

% Colorize the desired regions
% ----------------------------
idx_all = (L>0);
idx_show = [];
for i = 1:length(n);
    idx_show = [idx_show; find(L==n(i))];
end
L(idx_all) = 2;
L(idx_show) = 3;

% Display
% -------
h_fig_showregions = findobj('Tag','SRfigure');
if isempty(h_fig_showregions)
    figure('Tag','SRfigure')
else
    figure(h_fig_showregions)
end

imshow(L,[0 0 0;  % black
          1 1 1;  % white
          1 0 0]) % red

% EOF 'showregions'


function tf = isposints(N)
%ISPOSINT Returns TRUE when all the elements of N are 
% positive integers, and FALSE otherwise.

tf = ~( ~isreal(N) || any(N(:)<0) || ~isequal(round(N),N) );

% EOF 'isposints'
