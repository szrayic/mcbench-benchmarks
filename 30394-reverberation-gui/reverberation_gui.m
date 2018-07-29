global rec_h recs Fs r h_ecb h_plus h_minus h_auto h_dl ne

Fs=44100; % sampling frequency
dt=1/Fs;

r=NaN; % here will be recorder handle

ne=5; % number of echos

x=0.1;
y=0.87;

hf=figure;
set(hf,'units','normalized','position',[0.1 0.2 0.45 0.6]);
fcl=get(hf,'color');


rec_h = uicontrol('Style', 'togglebutton', 'String', 'record',...
    'units','normalized',...
    'Callback',['rec;'],...
    'BackgroundColor',[0.85 0.85 0.85],...
    'Position', [x y 0.12 0.05]);

recs=0; % here record will be stored

y=y-0.1;
x=x+0.07;

h = uicontrol('Style', 'text', 'String', 'delays (ms)',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Position', [x+0.3 y 0.22 0.05]);

y=y-0.1;


dy=0.1;
h_ecb=-ones(ne,1); % checkboxes handles
h_plus=-ones(ne,1); % plus buttons handles
h_minus=-ones(ne,1); % minus buttons handles
h_dl=-ones(ne,1); % deleays edit fields
dx1=0.2;
dx2=0.33;
dx3=0.5;
stp=5; % step
for yc=1:ne
    
    
    h_ecb(yc) = uicontrol('Style', 'checkbox', 'String', ['echo ' num2str(yc)],...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Value',1,...
    'Position', [x y 0.2 0.05]);

    h_minus(yc) = uicontrol('Style', 'pushbutton', 'String', ['-'],...
    'units','normalized',...
    'Callback',['step(' num2str(yc) ',' num2str(-stp) ');'] ,...
    'Position', [x+dx1 y 0.1 0.05]);

    h_dl(yc) = uicontrol('Style', 'edit', 'String', num2str(20+50*yc),...
    'units','normalized',...
    'Position', [x+dx2 y 0.15 0.05]);

    h_plus(yc) = uicontrol('Style', 'pushbutton', 'String', ['+'],...
    'units','normalized',...
    'Callback',['step(' num2str(yc) ',' num2str(stp) ');'] ,...
    'Position', [x+dx3 y 0.1 0.05]);
    
    y=y-dy;
end

y=y-0.5*dy;

h_auto = uicontrol('Style', 'checkbox', 'String', 'autoplay',...
    'units','normalized',...
    'BackgroundColor',fcl,...
    'Value',1,...
    'Position', [x+0.1 y 0.2 0.05]);

h = uicontrol('Style', 'pushbutton', 'String', 'play',...
    'units','normalized',...
    'Callback','pl',...
    'Position', [x+0.3 y 0.15 0.05]);

