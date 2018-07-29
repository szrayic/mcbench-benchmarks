function display(b)
% bsarray/display: display of bsarray object
% usage: display(b)
%
% arguments:
%   b - bsarray object
%

% author: Nathan D. Cahill
% email: ndcahill@gmail.com
% date: 18 April 2008

n = b.tensorOrder;

switch n
    case 0
        str = sprintf([ ...
            'DataArray:     [ Empty ] double array\n',...
            'Coefficients:  [ Empty ] double array\n',...
            'Degree:          Empty\n',...
            'Centred:         Empty\n',...
            'Element Spacing: Empty\n',...
            'Lambda:          Empty\n']);
    case 1
        str = sprintf([ ...
            'DataArray:     [ %d x %d ] double array\n',...
            'Coefficients:  [ %d x %d ] double array\n',...
            'Degree:          %d\n',...
            'Centred:         %d\n',...
            'Element Spacing: %g\n',...
            'Lambda:          %g\n'],...
            b.dataSize(1),b.dataSize(2),...
            b.coeffsSize(1),b.coeffsSize(2),...
            b.degree(1),b.centred(1),b.elementSpacing(1),b.lambda(1));
    case 2
        str = sprintf([ ...
            'DataArray:       [ %d x %d ] double array\n',...
            'Coefficients:    [ %d x %d ] double array\n',...
            'Degree:          [ %d %d ]\n',...
            'Centred:         [ %d %d ]\n',...
            'Element Spacing: [ %g %g ]\n',...
            'Lambda:          [ %g %g ]\n'],...
            b.dataSize(1),b.dataSize(2),...
            b.coeffsSize(1),b.coeffsSize(2),...
            b.degree(1),b.degree(2),...
            b.centred(1),b.centred(2),...
            b.elementSpacing(1),b.elementSpacing(2),...
            b.lambda(1),b.lambda(2));
    case 3
        str = sprintf([ ...
            'DataArray:       [ %d x %d x %d ] double array\n',...
            'Coefficients:    [ %d x %d x %d ] double array\n',...
            'Degree:          [ %d %d %d ]\n',...
            'Centred:         [ %d %d %d ]\n',...
            'Element Spacing: [ %g %g %g ]\n',...
            'Lambda:          [ %g %g %g ]\n'],...
            b.dataSize(1),b.dataSize(2),b.dataSize(3),...
            b.coeffsSize(1),b.coeffsSize(2),b.coeffsSize(3),...
            b.degree(1),b.degree(2),b.degree(3),...
            b.centred(1),b.centred(2),b.centred(3),...
            b.elementSpacing(1),b.elementSpacing(2),b.elementSpacing(3),...
            b.lambda(1),b.lambda(2),b.lambda(3));
    otherwise
        str = sprintf([...
            'DataArray:       [ %d - D double array ]\n',...
            'Coefficients:    [ %d - D double array ]\n',...
            'Degree:          [ ',repmat('%d ',1,numel(b.degree)),']\n',...
            'Centred:         [ ',repmat('%d ',1,numel(b.centred)),']\n',...
            'Element Spacing: [ ',repmat('%g ',1,numel(b.elementSpacing)),']\n',...
            'Lambda:          [ ',repmat('%g ',1,numel(b.lambda)),']\n'],...
            n,n,b.degree,b.centred,b.elementSpacing,b.lambda);
end
        
if isequal(get(0,'FormatSpacing'),'compact')
    disp([inputname(1) ' =']);
    disp(str);
else
    disp(' ');
    disp([inputname(1) ' =']);
    disp(' ');
    disp(str);
end