function varargout = Gui_0108(varargin)
% GUI_0108 MATLAB code for Gui_0108.fig
%      GUI_0108, by itself, creates a new GUI_0108 or raises the existing
%      singleton*.
%
%      H = GUI_0108 returns the handle to a new GUI_0108 or the handle to
%      the existing singleton*.
%
%      GUI_0108('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_0108.M with the given input arguments.
%
%      GUI_0108('Property','Value',...) creates a new GUI_0108 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_0108_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_0108_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_0108

% Last Modified by GUIDE v2.5 09-Jan-2023 00:49:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_0108_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_0108_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Gui_0108 is made visible.
function Gui_0108_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_0108 (see VARARGIN)

% Choose default command line output for Gui_0108
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_0108 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_0108_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1



[filename,pathname] = uigetfile('*.jpg');
set(handles.edit1,'String',filename);
inputfile = fullfile(pathname, filename);
I = imread(inputfile);%'test1.jpg'
axes(handles.axes1); %-------------axes-1
imshow(I);
title(handles.axes1,"captured car");
img = rgb2gray(I);
% imagesc(img)
t1 = double(histeq(img));
% imagesc(t1)
gx = [1 0 -1; 2 0 -2; 1 0 -1];
gy = gx';

thr = 150; threshold = 100; regions_thr = [70,5]; % test1
thr = 150;
x = imfilter(t1,gx);
% y = imfilter(t1,gy);
% g = sqrt(x.^2+y.^2);
ax = abs(x);
ax = round(ax/max(ax(:))*255);
% imagesc(ax)
ax(ax<thr)=0;
ax(ax>0)=1;

i4 = imclose(ax,ones(20));
% imagesc(i4)

t = double(bwlabel(i4));
coun = zeros(1,max(t(:)));

for i=1:size(t,1)
    for j=1:size(t,2)
        if t(i,j)>0
        coun(t(i,j)) = coun(t(i,j))+1;
        end
    end
end

[val,ind] =max(coun);
t(t~=ind)=0;
% imagesc(t)

sum_r = sum(t,1);
sum_c = sum(t,2);

for i=1:size(sum_r,2)-1
    if sum_r(i)==0 && sum_r(i+1)~=0
        left = i;
    end
    if sum_r(i)~=0 && sum_r(i+1)==0
        right = i-1;
    end
end

for i=1:size(sum_c,1)-1
    if sum_c(i)==0 && sum_c(i+1)~=0
        top = i;
    end
    if sum_c(i)~=0 && sum_c(i+1)==0
        butt = i-1;
    end
end

LiPl = img(top:butt,left:right);
figure;
imagesc(LiPl) %-----cannot be comment out ?
% axes(handles.axes1); %--------- output-2
% imshow(I);
% title(handles.axes1,"Captured Car");

set(gca, 'Visible', 'off');
colormap gray
saveas(gcf,'LiPl.jpg');
%%
fileName = 'LiPl.jpg';
licensePlate = imread(fileName);
% whos licensePlate;

%imshow(licensePlate);

licensePlateGray = rgb2gray(licensePlate);
% max(licensePlateGray(:));
% min(licensePlateGray(:));

% imshow(licensePlateGray);

% histogram(licensePlateGray);
%%
threshold = 80;
licensePlateBW = licensePlateGray < threshold;
% figure;
% imshow(licensePlateBW); %------- show

%%
whiteCountPerRow = sum(licensePlateBW,2);
%plot(whiteCountPerRow) %------- show
% xlabel('Row Number (Up-down)')
% ylabel('Number of White Pixels')
% grid on
% axis tight
%%
regions = whiteCountPerRow > regions_thr(1);

% plot(1:length(whiteCountPerRow), whiteCountPerRow)
% hold on
% plot(regions*400)
% hold off
% xlabel('Row Number (Up-down)')
% ylabel('Number of White Pixels')
% grid on
% axis tight
% legend('White Count', 'Regions')

regions = [0; regions; 0];
% plot(diff(regions));

startIdx = find(diff(regions)==1);

endIdx = find(diff(regions)==-1);
if endIdx(end) > size(licensePlateBW,1)
    endIdx(end) = size(licensePlateBW,1);
end
% endIdx

% endIdx-startIdx;

[~,widestRegionIdx] = max(endIdx-startIdx);

upperLimitROI = startIdx(widestRegionIdx);

lowerLimitROI = endIdx(widestRegionIdx);

licensNumberROI = licensePlateBW(upperLimitROI:lowerLimitROI,:);
% imshow(licensNumberROI);

whiteCountPerColumn = sum(licensNumberROI,1);
% imshow(licensNumberROI);
% hold on
% plot(max(whiteCountPerColumn) - whiteCountPerColumn,'r',"LineWidth",3)
%plot(whiteCountPerColumn,'r',"LineWidth",3) %-----show
% xlabel('Row Number (Left-Right)')
% ylabel('Number of White Pixels')
% grid on
% axis tight
% hold off
%%
regions = whiteCountPerColumn > regions_thr(2);
%    
% plot(whiteCountPerColumn)
% hold on
%plot(regions*400) %-----show
% hold off
% xlabel('Row Number (Up-down)')
% ylabel('Number of White Pixels')
% grid on
% axis tight
% legend('White Count', 'Regions')

regions = [0 regions 0];
% plot(diff(regions))
%%
startIdx = find(diff(regions)==1);

endIdx = find(diff(regions)==-1);
if endIdx(end) > size(licensePlateBW,2)
    endIdx(end) = size(licensePlateBW,2);
end
% endIdx

regions = endIdx-startIdx;

widthThreshold = mean(regions);

letterImage = licensNumberROI(:,startIdx(2):endIdx(2));
% imshow(letterImage)

templateDir = fullfile(pwd,'templates');
templates = dir(fullfile(templateDir,"*.png"));

% figure;
candidateImage = cell(length(templates),2);

for p=1:length(templates)
%     subplot(6,7,p)
    [~,fileName] = fileparts(templates(p).name);
    candidateImage{p,1} = fileName;
    candidateImage{p,2} = imread(fullfile(templates(p).folder,templates(p).name));
%     imshow(candidateImage{p,2});
end

template1 = imread(fullfile(templates(1).folder,templates(1).name));
% figure
% imshow(template1)

x = 1;
y = 4;
distance1D = abs(x-y);

x = [1 2];
y = [4 -1];
temp = x - y;
distance2D = sqrt(abs(temp(1)^2 + temp(2)^2));

x = randi(10,1,4);

y = randi(10,1,4);
temp = x - y;
distanceND = sqrt(abs(sum(temp.^2)));

letterImage = imresize(letterImage,size(template1));
% figure
% subplot(1,2,1)
% imshow(letterImage)
% subplot(1,2,2)
% imshow(template1)

distance = abs(sum((letterImage-double(template1)).^2,"all"))/numel(template1); %#ok<NASGU> 
distance = zeros(1,length(templates));
for p=1:length(templates)
    distance(p) = abs(sum((letterImage-double(candidateImage{p,2})).^2,"all"))/numel(candidateImage{p,2});
end
% figure
chars = ["0","1","2","3","4","5","6","7","8","9",...
   "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O", ...
   "P","Q","R","S","T","U","V","W","X","Y","Z","~"];
% plot(distance)
% xticklabels(chars)
% xticks(1:length(chars))
% xlim([1 37])
% grid on

[d,idx] = min(distance);
% templates(idx)

[~,letter] = fileparts(templates(idx).name);

licenseNumber = '';
for p=1:length(regions)
    if regions(p) > widthThreshold
        % Extract the letter
        letterImage = licensNumberROI(:,startIdx(p):endIdx(p));

        % Compare to templates
        distance = zeros(1,length(templates));
        for t=1:length(templates)
            letterImage = imresize(letterImage,size(candidateImage{t,2}));
            distance(t) = abs(sum((letterImage-double(candidateImage{t,2})).^2,"all"));
        end
        [d,idx] = min(distance);
        letter = candidateImage{idx,1};
        if strcmp(letter, 'map')
            letter = '~';
        end
        licenseNumber(end+1) = letter; %#ok<SAGROW> 
    end
end

axes(handles.axes2);
imshow(LiPl);
title({"Preprocessing Result";['License Number = ',num2str(licenseNumber)]});
%title(handles.axes3,"Preprocessing Result");









% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
