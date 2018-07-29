function handle = missionbox(mission, name)

res = get(0, 'ScreenSize');

handle = ...
figure('Name', 'Mission', ...
       'Units', 'pixels', ...
       'MenuBar', 'none', ...
       'NumberTitle', 'off', ...
       'Position', [res(3:4)/3, 400, 150], ...
       'ButtonDownFcn', {@ShowMission, mission});

uicontrol('style', 'text', ...
      'Units', 'normalized', ...
      'Parent', handle, ...
      'FontSize', 14, ... 
      'BackgroundColor', get(handle, 'Color'), ...
      'Position', [0.1, 0.5, 0.8, 0.3], ...
      'Enable', 'inactive', ...
      'HitTest', 'off', ...
      'String', sprintf('%s, click to display your secret mission...', name));
      
uicontrol('style', 'pushbutton', ...
      'String', 'OK', ...
      'Parent', handle, ...
      'Units', 'normalized', ...
      'Visible', 'Off', ...
      'Position', [0.4, 0.1, 0.2, 0.2], ...
      'Callback', @(~,~)(delete(handle)));

function ShowMission(fig,~, mission)

txt = findobj('Parent', fig, 'style', 'text');
btn = findobj('Parent', fig, 'style', 'pushbutton');
set(txt, 'String', mission)
set(btn, 'Visible', 'on')
      