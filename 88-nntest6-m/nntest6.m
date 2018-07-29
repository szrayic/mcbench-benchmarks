function nntest6(action,flag);
%NNTEST6 View  and Control Neural network.
%
%
%	See also SIMUFF.

% Koos j. den Oudsten, 1-20-99
% koos@phil.uu.nl
% Copyright (c) 1998-99 by KoosSoft vof
% $Revision: 0.4 $  $Date: 1999/01/27 22:29:28 $

global Xx w1 b1 w2 b2 hidden mlp

if nargin < 1
    action = 'start';
end

%On recursive calls get all necessary handles and data.
if ~strcmp(action,'start')   
   childList = allchild(0);
   nn_fig = childList(find(childList == gcf));
   ud = gco;

%   popupvalue = get(ud.popup,'Value');

   switch action
      case {'Sw1', 'Sw2', 'Sw3', 'Sw4', 'Sw5', 'Sw6', 'Sb1', 'Sb2', 'Sb3', 'Sb4'}
         val=get(ud,'value');b=allchild(nn_fig);
	 c=findall(b,'tag',strrep(action,'S',''));set(c,'string',val);
		switch action
			case 'Sw1',w1(1)=val;
			case 'Sw2',w1(2)=val;
			case 'Sw3',w1(3)=val;
			case 'Sb1',b1(1)=val;
			case 'Sb2',b1(2)=val;
			case 'Sb3',b1(3)=val;
			case 'Sw4',w2(1)=val;
			case 'Sw5',w2(2)=val;
			case 'Sw6',w2(3)=val;
			case 'Sb4',b2(1)=val;
		end
	 action='plot';
      case 'train', 
         x=0:0.05:5';plot(x,exp((-0.1.*x.^2)).*sin(4.*x));
      case {'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'b1', 'b2', 'b3', 'b4'}
         val=str2num(get(ud,'String'));
	 if val > 15  val=15; end; if val < -15  val =-15; end;
	 set(ud,'String',val);
	 b=allchild(nn_fig);
	 c=findall(b,'tag',strcat('S',action));set(c,'value',val);
		switch action
			case 'w1',w1(1)=val;
			case 'w2',w1(2)=val;
			case 'w3',w1(3)=val;
			case 'b1',b1(1)=val;
			case 'b2',b1(2)=val;
			case 'b3',b1(3)=val;
			case 'w4',w2(1)=val;
			case 'w5',w2(2)=val;
			case 'w6',w2(3)=val;
			case 'b4',b2(1)=val;
		end
	 action='plot';
      case 'reset',
         close(gcf);action='start';
      case 'set',
	 if mlp == 1,
         w1=[0.72 -0.83 0.83]';b1=[-1.8 4 -0.15]';w2=[-2 -1.7 1.7];b2=[0];
	 else w1=[0.5 2.5 4.6]';b1=[1.65 1.35 1]';w2=[3.1 2.4 1.9];b2=[-1.65];
	 end;
	 action='update';
      case 'grid',
         grid;
      case 'mlprbf',
	 if mlp == 1, mlp=0;
	 set(nn_fig,'Name','Neural Network Viewer (rbf)                  by  Koos j. den Oudsten');
	 else mlp =1;set(nn_fig,'Name','Neural Network Viewer (mlp)                  by  Koos j. den Oudsten');
	 end;
	 action='plot';
      case 'hidden',
         if hidden ==0, hidden=1; else hidden =0; end;
	 action='plot';
      case 'hold',
         hold; 
   end
 disp(action);disp(ud);% test

end
% -----------------------------------------------------------------------
if strcmp(action,'update')  		  
	b=allchild(nn_fig);
	
	set(findall(b,'tag','Sw1'),'value',w1(1));
	set(findall(b,'tag','Sw2'),'value',w1(2));
	set(findall(b,'tag','Sw3'),'value',w1(3));
	set(findall(b,'tag','Sb1'),'value',b1(1));
	set(findall(b,'tag','Sb2'),'value',b1(2));
	set(findall(b,'tag','Sb3'),'value',b1(3));
	set(findall(b,'tag','Sw4'),'value',w2(1));
	set(findall(b,'tag','Sw5'),'value',w2(2));
	set(findall(b,'tag','Sw6'),'value',w2(3));
	set(findall(b,'tag','Sb4'),'value',b2(1));

	set(findall(b,'tag','w1'),'string',w1(1));
	set(findall(b,'tag','w2'),'string',w1(2));
	set(findall(b,'tag','w3'),'string',w1(3));
	set(findall(b,'tag','b1'),'string',b1(1));
	set(findall(b,'tag','b2'),'string',b1(2));
	set(findall(b,'tag','b3'),'string',b1(3));
	set(findall(b,'tag','w4'),'string',w2(1));
	set(findall(b,'tag','w5'),'string',w2(2));
	set(findall(b,'tag','w6'),'string',w2(3));
	set(findall(b,'tag','b4'),'string',b2(1));

action='plot';
end


if strcmp(action,'plot')
	set(nn_fig,'DefaultAxesColorOrder',[1 0 0;0 1 0;0 0 1;1 1 0;1 0 1;0 0 0;0 1 1]);
	if mlp ==1, [hid,out]=simuff(Xx,w1,b1,'tansig',w2,b2,'purelin');
	else [hid,out]=simurb(Xx,w1,b1,w2,b2);
	end
	if hidden ==1,plot(Xx,out,'k',Xx,0,'r',Xx,hid);
		else plot(Xx,out,'k',Xx,0);
	end
	axis([0 5 -2 2]);axis manual;
end

%  Initialize all GUI objects. 
if strcmp(action,'start')
% Set positions of graphic objects

Xx=0:0.05:5;w1=[0 0 0]';b1=[0 0 0]';w2=[0 0 0];b2=[0];% init weights en biases
hidden =0;mlp=1;% mlp mode 

a = figure('Color',[0.8 0.8 0.8], ...
	'Position',[23 27 756 504], ...
'Name','Neural Network Viewer (mlp)                  by  Koos j. den Oudsten', ...
        'NumberTitle','off','Tag','NN-fig');
b = uimenu('Parent',a, ...
	'Label','Options', ...
	'Tag','NNmenu');
uimenu(b,'label','mlp <-> rbf', 'callback','nntest6(''mlprbf'')');
uimenu(b,'label','grid', 'callback','nntest6(''grid'')');
uimenu(b,'label','test', 'callback','nntest6(''test'')');
uimenu(b,'label','train','callback','nntest6(''train'')');
uimenu(b,'label','reset','callback','nntest6(''reset'')');
uimenu(b,'label','hold', 'callback','nntest6(''hold'')');
b = axes('Parent',a, ...
	'Units','points', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'Position',[40.9655 125.379 410.897 180.621], ...
	'Tag','NetFigure', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
c = text('Parent',b, ...
	'Color',[0 0 0], ...
	'HandleVisibility','callback', ...
	'HorizontalAlignment','center', ...
	'Position',[0.498489 -0.0965517 0], ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(c,'Parent'),'XLabel',c);
c = text('Parent',b, ...
	'Color',[0 0 0], ...
	'HandleVisibility','callback', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.0528701 0.496552 0], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(c,'Parent'),'YLabel',c);
c = text('Parent',b, ...
	'Color',[0 0 0], ...
	'HandleVisibility','callback', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.0996979 1.03448 0], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(c,'Parent'),'ZLabel',c);
c = text('Parent',b, ...
	'Color',[0 0 0], ...
	'HandleVisibility','callback', ...
	'HorizontalAlignment','center', ...
	'Position',[0.498489 1.02759 0], ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(c,'Parent'),'Title',c);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw1'')', ...
	'Position',[22.3448 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw1','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw2'')', ...
	'Position',[63.5862 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw2','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw3'')', ...
	'Position',[104.828 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw3','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sb1'')', ...
	'Position',[146.069 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sb1','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sb2'')', ...
	'Position',[187.621 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sb2','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sb3'')', ...
	'Position',[229.483 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sb3','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw4'')', ...
	'Position',[307.241 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw4','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw5'')', ...
	'Position',[348.483 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw5','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sw6'')', ...
	'Position',[389.724 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sw6','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''Sb4'')', ...
	'Position',[430.966 31.1724 16.1379 63.931], ...
	'Style','slider','SliderStep',[0.0025 0.01], ...
	'Tag','Sb4','Min',-15.0,'Max',15.0, ...
	'Value',0.0);
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w1'')', ...
	'BackgroundColor',[1 .7 .7], ...
	'Position',[11.7931 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w1', ...
	'Tag','w1');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w2'')', ...
	'BackgroundColor',[.7 1 .7], ...
	'Position',[53.0345 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w2', ...
	'Tag','w2');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w3'')', ...
	'BackgroundColor',[.7 .7 1], ...
	'Position',[94.2759 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w3', ...
	'Tag','w3');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''b1'')', ...
	'BackgroundColor',[1 .7 .7], ...
	'Position',[135.517 17.3793 37.2414 12.4138], ...
	'Style','edit','String','b1', ...
	'Tag','b1');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''b2'')', ...
	'BackgroundColor',[.7 1 .7], ...
	'Position',[176.759 16.7586 37.8621 13.0345], ...
	'Style','edit','String','b2', ...
	'Tag','b2');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''b3'')', ...
	'BackgroundColor',[.7 .7 1], ...
	'Position',[218.621 16.7586 37.8621 13.0345], ...
	'Style','edit','String','b3', ...
	'Tag','b3');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w4'')', ...
	'BackgroundColor',[1 1 1], ...
	'Position',[296.69 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w4', ...
	'Tag','w4');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w5'')', ...
	'BackgroundColor',[1 1 1], ...
	'Position',[337.931 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w5', ...
	'Tag','w5');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''w6'')', ...
	'BackgroundColor',[1 1 1], ...
	'Position',[379.172 17.3793 37.2414 12.4138], ...
	'Style','edit','String','w6', ...
	'Tag','w6');
b = uicontrol('Parent',a, ...
	'Units','points', ...
	'Callback','nntest6(''b4'')', ...
	'BackgroundColor',[1 1 1], ...
	'Position',[420.414 16.7586 37.2414 13.0345], ...
	'Style','edit','String','b4', ...
	'Tag','b4');
b = uicontrol('Parent',a, ...
	'Units','points','string','hold', ...
	'Callback','nntest6(''hold'')', ...
	'Position',[260 80 34 16], ...
	'Tag','button1');
b = uicontrol('Parent',a, ...
	'Units','points','string','grid', ...
	'Callback','nntest6(''grid'')', ...
	'Position',[260 60 34 16], ...
	'Tag','button2');
b = uicontrol('Parent',a, ...
	'Units','points','string','set', ...
	'Callback','nntest6(''set'')', ...
	'Position',[260 40 34 16], ...
	'Tag','button3');
b = uicontrol('Parent',a, ...
	'Units','points','string','hidden', ...
	'Callback','nntest6(''hidden'')', ...
	'Position',[260 20 34 16], ...
	'Tag','button4');
end

