function EF = EvalFunctionsDemo(varargin);

% function EF = EvalFunctionsDemo(varargin);
% 
% Returns an evalfunctions GUO initialised with the MATLAB
% Low-Level File I/O functions (and parameter types).
% The argument list varargin is passed on to evalfunctions.
%
% Copyright (c) SINUS Messtechnik GmbH 2003
% www.sinusmess.de - Sound & Vibration Instrumentation
%                  - PCB Services
%                  - Electronic Design & Production

% The figure would not normally be created in this function -
% the following is a convenient default size for the demonstration.
if isempty(get(0, 'CurrentFigure'))
   figure('Units', 'normalized', 'Position', [0.05 0.85 0.9 0.1]);
end

EF = evalfunctions('Visible', 'on', varargin{:});  % Create GUO

evalin('base', 'A_output = magic(5);');  % Purely test data...

% Define the types of parameters used by the functions
EF = setparametertypes(EF, ...
     ...  % Output
     {'A_output' 'Output'}, ...            
     {'count' 'Output'}, ...            
     {'eofstat' 'Output'}, ...            
     {'errnum' 'Output'}, ...            
     {'fid_output' 'Output'}, ...            
     {'fids_output' 'Output'}, ...            
     {'filename_output' 'Output'}, ...            
     {'machineformat_output' 'Output'}, ...            
     {'message' 'Output'}, ...            
     {'permission_output' 'Output'}, ...            
     {'position' 'Output'}, ...            
     {'status' 'Output'}, ...            
     {'tline' 'Output'}, ...            
     ...  % Number
     {'nchar' 'Number' 'String' 'inf'}, ...
     {'offset' 'Number' 'String' '0'}, ...
     {'size' 'Number' 'String' 'inf'}, ...
     {'skip' 'Number' 'String' '0'}, ...
     ...  % String
     {'fclose_all' 'String' 'String' 'all' 'Enable' 'off'}, ...
     {'ferror_clear' 'String' 'String' 'clear' 'Enable' 'off'}, ...
     {'filename' 'String' 'String' ''}, ...
     {'fopen_all' 'String' 'String' 'all' 'Enable' 'off'}, ...
     {'format' 'String' 'String' '%12.5e'}, ...
     {'origin' 'String' 'Style' 'popupmenu' 'String' 'bof|cof|eof'}, ...
     {'permission' 'String' 'Style' 'popupmenu' ...
        'String' 'r|w|a|r+|w+|a+|A|W'}, ...
     {'precision' 'String' 'String' 'double'}, ...
     {'machineformat' 'String' 'Style' 'popupmenu' ...
        'Units' 'pixels' 'Position' [0 0 120 20] ...
        'Value' 6 ...
        'String' {'Cray, big-endian', ...
                  'IEEE, big-endian', ...
                  'IEEE, little-endian', ...
                  'IEEE 64-bit, big-endian', ...
                  'IEEE 64-bit, little-endian', ...
                  'Native', ...
                  'VAX D', ...
                  'VAX G'} ...
        'UserData' 'c|b|l|s|a|n|d|g'}, ...
     ...  % Reference
     {'A' 'Reference' 'String' 'A_output'}, ...
     {'fid' 'Reference' 'String' 'fid_output'});

% Define the functions themselves
EF = setfunctions(EF, ...
     {'fclose' 'status' 'fid'}, ...
     {'fclose|fclose (all)' 'status' 'fclose_all'}, ...
     {'feof' 'eofstat' 'fid'}, ...
     {'ferror' 'message' 'errnum' 'fid'}, ...
     {'ferror|ferror (clear)' 'message' 'errnum' 'fid' 'ferror_clear'}, ...
     {'fgetl' 'tline' 'fid'}, ...
     {'fgets' 'tline' 'fid' 'nchar'}, ...
     {'fopen' 'fid_output' 'message' 'filename' 'permission' 'machineformat'}, ...
     {'fopen|fopen (all)' 'fids_output' 'fopen_all'}, ...
     {'fopen|fopen (query)' 'filename_output' 'permission_output' ...
                            'machineformat_output' 'fid'}, ...
     {'fprintf' 'count' 'fid' 'format' 'A'}, ...
     {'fread' 'A_output' 'count' 'fid' 'size' 'precision' 'skip'}, ...
     {'frewind' 'fid'}, ...
     {'fscanf' 'A_output' 'count' 'fid' 'format' 'size'}, ...
     {'fseek' 'status' 'fid' 'offset' 'origin'}, ...
     {'ftell' 'position' 'fid'}, ...
     {'fwrite' 'count' 'fid' 'A' 'precision' 'skip'});
