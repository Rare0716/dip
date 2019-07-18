function varargout = homework(varargin)
% homework MATLAB code for homework.fig
%      homework, by itself, creates a new homework or raises the existing
%      singleton*.
%
%      H = homework returns the handle to a new homework or the handle to
%      the existing singleton*.
%
%      homework('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in homework.M with the given input arguments.
%
%      homework('Property','Value',...) creates a new homework or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% adjust the above text to modify the response to help homework

% Last Modified by GUIDE v2.5 13-Jun-2019 19:17:35

% Begin initialization code - DO NOT ADJUST
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @homework_OpeningFcn, ...
    'gui_OutputFcn',  @homework_OutputFcn, ...
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
% End initialization code - DO NOT ADJUST


% --- Executes just before homework is made visible.
function homework_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework (see VARARGIN)

% Choose default command line output for homework
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework wait for user response (see UIRESUME)
% uiwait(handles.mainFig);


% --- Outputs from this function are returned to the command line.
function varargout = homework_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function adjust_Callback(hObject, eventdata, handles)
% hObject    handle to adjust (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function image_Callback(hObject, eventdata, handles)
    %h=msgbox("���ڴ��������£�");
    %uiwait(h);
% hObject    handle to image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_img_Callback(hObject, eventdata, handles)
set(handles.hint,"Visible","off");
%��ʼ�����ýṹԪ��
se=ones(3,3);
handles.se=se;
[img_name,img_path]=uigetfile({'*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.png'},"ѡ��ͼƬ");
if img_name==0
    return
end
img=imread([img_path,img_name]);

imgInfo=imfinfo([img_path,img_name]);
handles.imgInfo=imgInfo;
% ����imgInfo
axes(handles.img_zone);
imshow(img);
%��ʾͼƬ
pos=get(handles.img_zone,'pos');
pos(1:4)=[450-imgInfo.Width/2 350-imgInfo.Height/2  imgInfo.Width imgInfo.Height];
set(handles.img_zone,'pos',pos);
%������������Ҫ������
handles.rawImg=img;
handles.new_img=img;
handles.img_name=img_name;
handles.img_path=img_path;
% ������Ϣ���
% imgFields=fieldnames(imgInfo);
% infoCell=cell(length(imgFields),2);
% for i=1:length(imgFields)
%     value=getfield(imgInfo,imgFields{i});
%     infoCell{i,1}=imgFields{i};
%     infoCell{i,2}=value;
% end
% 
% set(handles.infoTable,'Data',infoCell);

guidata(hObject,handles);
% hObject    handle to open_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_img_Callback(hObject, eventdata, handles)
new_img=handles.new_img;
img_path=handles.img_path;
img_name=handles.img_name;
imwrite(new_img,[img_path img_name]);
msgbox("�ѱ���","��ʾ");
% hObject    handle to save_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_another_Callback(hObject, eventdata, handles)
[img_name,img_path]=uiputfile({'*.jpg;*.jpeg;*.bmp;*.tif;*.tiff'},"���Ϊ");
new_img=handles.new_img;
imwrite(new_img,[img_path img_name]);
% hObject    handle to save_another (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mean_filter_Callback(hObject, eventdata, handles)
    %img_path=handles.img_path;
    %img_name=handles.img_name;
    img=handles.new_img;
    %�õ��û������ģ���С��Ĭ��Ϊ3
    definput={'3'};
    while true
        input=inputdlg("����ģ���С,��3x3����3����,����Ϊ����","ģ���С",[1 40],definput);
        if isempty(input)
            return
        end
        template_size=str2double(input);
        if mod(template_size,2)==1
           break
        end
        f=errordlg("����������","ģ���С����");
        uiwait(f);
    end
    %����ͼƬ�ľ�ֵ�˲�
    new_img=mean_smooth(img,template_size);
    imshow(new_img);
    handles.new_img=new_img;
    guidata(hObject,handles);


% hObject    handle to mean_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function mid_filter_Callback(hObject, eventdata, handles)
% img_path=handles.img_path;
% img_name=handles.img_name;
img=handles.new_img;
definput={'3'};
 %�õ��û������ģ���С��Ĭ��Ϊ3
while true
    input=inputdlg("����ģ���С,��3x3����3����,����Ϊ����","ģ���С",[1 40],definput);
    if isempty(input)
        return
    end
    template_size=str2double(input);
    if mod(template_size,2)==1
       break
    end
    f=errordlg("����������","ģ���С����");
    uiwait(f);
end
%������ֵ�˲�
new_img=mid_smooth(img,template_size);
imshow(new_img);
handles.new_img=new_img;
guidata(hObject,handles);
% hObject    handle to mid_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function first_sharpen_Callback(hObject, eventdata, handles)
%     img_path=handles.img_path;
%     img_name=handles.img_name;
img=handles.new_img;
 %�õ��û������ѡ��
[index,tf]=listdlg("ListString",{'��ͨˮƽ','��ͨ��ֱ','Sobelˮƽ','Sobel��ֱ','Rebortsˮƽ','Reborts��ֱ','Prewittˮƽ','Prewitt��ֱ'},"Name","ѡ����","SelectionMode","Single","ListSize",[200 130]);
%����ѡ�������
if index==1
    new_img=first_sharpen(img,1);
elseif index==2
    new_img=first_sharpen(img,2);
elseif index==3
    new_img=sobel_first_sharpen(img,1);
elseif index==4
    new_img=first_sharpen(img,2);
elseif index==5
    new_img=reborts_first_sharpen(img,1);
elseif index==6
    new_img=reborts_first_sharpen(img,2);
elseif index==7
    new_img=prewitt_first_sharpen(img,1);
elseif index==8
    new_img=prewitt_first_sharpen(img,2);
end
imshow(new_img);
handles.new_img=new_img;
guidata(hObject,handles);
% hObject    handle to first_sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function second_sharpen_Callback(hObject, eventdata, handles)
% img_path=handles.img_path;
% img_name=handles.img_name;
img=handles.new_img;
%�õ��û������ѡ��
[index,tf]=listdlg("ListString",{'��ͨˮƽ','��ͨ��ֱ','Laplacian��ͨ','Laplacian�Խ�'},"Name","ѡ����","SelectionMode","Single","ListSize",[200 100]);
%����ѡ�������
if index==1
    
    new_img=second_sharpen(img,1);
elseif index==2
    new_img=second_sharpen(img,2);
elseif index==3
    new_img=laplacian_second_sharpen(img,1);
elseif index==4
    new_img=laplacian_second_sharpen(img,2);
end

axes(handles.img_zone);
imshow(new_img);
handles.new_img=new_img;
guidata(hObject,handles);
% hObject    handle to second_sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function template_size_Callback(hObject, eventdata, handles)
% hObject    handle to template_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function template_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to template_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function shear_Callback(hObject, eventdata, handles)
img=handles.new_img;
img=imcrop(img);
%�ж��Ƿ��ͼ
if isempty(img)
    img=handles.new_img;
end
handles.new_img=img;
imgInfo=handles.imgInfo;

%���µ���ͼƬ��λ��
pos=get(handles.img_zone,'pos');
pos(1:4)=[450-imgInfo.Width/2 350-imgInfo.Height/2  imgInfo.Width imgInfo.Height];
set(handles.img_zone,'pos',pos);
imshow(img);
%��ʾͼƬ
guidata(hObject,handles);
% hObject    handle to shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function zoom_Callback(hObject, eventdata, handles)
img=handles.new_img;
%�õ��û����������ű���
input=inputdlg("�������ű���","���Ŵ�С",[1 40],{'1'});
scale=str2double(input);

imgInfo=handles.imgInfo;
imgInfo.Height=imgInfo.Height*scale;
imgInfo.Width=imgInfo.Width*scale;

%ͼƬ���е�����С
img=imresize(img,scale);
%��������ͼƬλ��
imshow(img);
pos=get(handles.img_zone,'pos');
pos(1:4)=[450-imgInfo.Width/2 350-imgInfo.Height/2  imgInfo.Width imgInfo.Height];
set(handles.img_zone,'pos',pos);
handles.new_img=img;
handles.imgInfo=imgInfo;
guidata(hObject,handles);
% hObject    handle to zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fourier_Callback(hObject, eventdata, handles)
% hObject    handle to fourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function one_discrete_Callback(hObject, eventdata, handles)
% img_path=handles.img_path;
% img_name=handles.img_name;
% img=imread([img_path img_name]);
img=handles.new_img;
sz=size(img);
f=zeros(sz);

%ֱ�ӵ��ÿ⺯�����и���Ҷ�任������Ч��
if numel(sz)==2
    f=fft(img);
end
if numel(sz)>2
    for i=1:sz(3)
       f(:,:,i)=fft(img(:,:,i));
    end
end
imshow(f);
show_in_img(f);
handles.f=f;
guidata(hObject,handles);
% hObject    handle to one_discrete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function two_discrete_Callback(hObject, eventdata, handles)
% img_path=handles.img_path;
% img_name=handles.img_name;
% img=imread([img_path img_name]);
img=handles.new_img;
sz=size(img);
f=zeros(sz);

%ֱ�ӵ��ÿ⺯�����и���Ҷ�任������Ч��
if numel(sz)==2
    f=fft(img);
end
if numel(sz)>2
    for i=1:sz(3)
        f(:,:,i)=fft2(img(:,:,i));
    end
end
imshow(f);
show_in_img(f);
handles.f=f;
guidata(hObject,handles);
% hObject    handle to two_discrete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function morphology_Callback(hObject, eventdata, handles)
% hObject    handle to morphology (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function binProcess_Callback(hObject, eventdata, handles)
% hObject    handle to binProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
flag=inputdlg("��������ֵ",'��ֵ��',[1 40],{'128'});
flag=str2double(flag)/255;
img=im2bw(img,flag);
handles.new_img=img;
axes(handles.img_zone);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);


% --------------------------------------------------------------------
function expand_Callback(hObject, eventdata, handles)
img=handles.new_img;
%�õ��ṹԪ��
se=handles.se;
%����ͼƬ����
img=imdilate(img,se);
handles.new_img=img;
axes(handles.img_zone);
imshow(img);
guidata(hObject,handles);
% hObject    handle to expand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function etch_Callback(hObject, eventdata, handles)
img=handles.new_img;
%�õ��ṹԪ��
se=handles.se;
%����ͼƬ��ʴ
img=imerode(img,se);
handles.new_img=img;
axes(handles.img_zone);
imshow(img);
guidata(hObject,handles);
% hObject    handle to etch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
se=handles.se;
%����ͼƬ������
img=imopen(img,se);
handles.new_img=img;
axes(handles.img_zone);
imshow(img);
guidata(hObject,handles);

% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
se=handles.se;
%����ͼƬ�ز���
img=imclose(img,se);
handles.new_img=img;
axes(handles.img_zone);
imshow(img);
guidata(hObject,handles);

% --------------------------------------------------------------------
function structUnit_Callback(hObject, eventdata, handles)
result=listdlg('ListString',{"����","Բ��","Բ��","ʮ��","��","����"},'ListSize',[160,100],'SelectionMode','single');
switch result
    case 1
        se=makeRectangle();
    case 2
        se=makeCircle();
    case 3
        se=makeRing();
    case 4
        se=makeCross();
    case 5
        se=makeLine();
    case 6
        se=makeDiamond();
end
%������ͬ���͵ĽṹԪ��
handles.se=se;
guidata(hObject,handles);

% hObject    handle to structUnit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function weightingFilter_Callback(hObject, eventdata, handles)
% hObject    handle to weightingFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
definput={'1','2'};
input=inputdlg({"����Խ�Ȩ��","�������ڱ�Ȩ��"},"��Ȩģ��3x3",[1 40;1 40],definput);
if isempty(input)
    return
end

%���Ӽ�Ȩ���˲�ģ��
template_size=str2double(input);
h=zeros(3,3);
h(2,:)=template_size(2,1);
h(:,2)=template_size(2,1);
h(1,1)=template_size(1,1);
h(1,3)=template_size(1,1);
h(3,1)=template_size(1,1);
h(3,3)=template_size(1,1);
h=h./sum(sum(h));
img=handles.new_img;
new_img=imfilter(img,h);
imshow(new_img);
handles.new_img=new_img;
guidata(hObject,handles);


% hObject    handle to mean_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------


% --------------------------------------------------------------------
function restore_Callback(hObject, eventdata, handles)
img=handles.rawImg;
handles.new_img=img;
imshow(img);
guidata(hObject,handles);
%��ͼƬ��ԭ�����������
% hObject    handle to restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function imgDivision_Callback(hObject, eventdata, handles)
% hObject    handle to imgDivision (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function otsu_Callback(hObject, eventdata, handles)
img=handles.new_img;
%ͼƬ���д�򷨷�
img=otsu(img);
axes(handles.img_zone);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);
% hObject    handle to otsu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function iter_Callback(hObject, eventdata, handles)
img=handles.new_img;
img=iter(img);
%ͼ����е������ָ�
axes(handles.img_zone);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function iDftChg_Callback(hObject, eventdata, handles)
% hObject    handle to iDftChg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=handles.f;
sz=size(f);
%ֱ�ӵ��ÿ⺯�����з�����Ҷ�任������Ч��
%�ж�sz�ĸ���
if numel(sz)==2
    img=ifft(f);
end
if numel(sz)>2
    for i=1:sz(3)
        img(:,:,i)=ifft(f(:,:,i));
    end
end
img=uint8(img);
imshow(img);
% handles.new_img=img;
guidata(hObject,handles);


% --------------------------------------------------------------------
function iDft2Chg_Callback(hObject, eventdata, handles)
% hObject    handle to iDft2Chg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=handles.f;
sz=size(f);
%ֱ�ӵ��ÿ⺯�����з�����Ҷ�任������Ч��
if numel(sz)==2
    img=ifft(f);
end
if numel(sz)>2
    for i=1:sz(3)
        img(:,:,i)=ifft2(f(:,:,i));
    end
end
img=uint8(img);
imshow(img);
guidata(hObject,handles);


% --------------------------------------------------------------------
function enhance_Callback(hObject, eventdata, handles)
% hObject    handle to enhance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function segment_Callback(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function threSegm_Callback(hObject, eventdata, handles)
% hObject    handle to threSegm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
level=graythresh(handles.new_img);
handles.new_img=im2bw(handles.new_img,level);
imshow(handles.new_img);
guidata(hObject,handles);

% --------------------------------------------------------------------
function edgeExtra_Callback(hObject, eventdata, handles)
img=handles.new_img; 
sz=size(img);
if numel(sz)>2
    img=rgb2gray(img);
end
%ͼ����б�Ե��ȡ
img=edge(img);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);
% hObject    handle to edgeExtra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function histogram_Callback(hObject, eventdata, handles)
img=handles.new_img;
figure('NumberTitle', 'off', 'Name', 'ֱ��ͼ');
imhist(img);
%��ʾͼƬ��ֱ��ͼ
% handles.imgHist=
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function equal_Callback(hObject, eventdata, handles)
img=handles.new_img;
%��ͼƬ���о��⻯
img=histeq(img);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);
% hObject    handle to equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function smooth_Callback(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sharpen_Callback(hObject, eventdata, handles)
% hObject    handle to sharpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
%��ͼƬ����rgbת�Ҷ�
img=rgb2gray(img);
handles.new_img=img;
imshow(handles.new_img);
guidata(hObject,handles);

% --------------------------------------------------------------------
function rgb2bin_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2bin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
%�Ƚ�ͼƬת�Ҷȣ��ٽ�ͼƬת�ڰ�
img=rgb2gray(img);
img=otsu(img);
handles.new_img=img;
imshow(img);
guidata(hObject,handles);

% --------------------------------------------------------------------
function gray2bin_Callback(hObject, eventdata, handles)
% hObject    handle to gray2bin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
sz=size(img);
if numel(sz)>2
    errordlg("ͼƬ���ǻҶ�ͼƬ",'����');
end
%���Ҷ�ͼƬת�ڰ�
img=otsu(img);
handles.new_img=img;
imshow(img);
guidata(hObject,handles);


% --------------------------------------------------------------------
function useGuide_Callback(hObject, eventdata, handles)
open("��ҵfinal��������ֲ�.pdf");
% hObject    handle to useGuide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
f = msgbox("����qq��1983782527","����");
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openImg_ClickedCallback(hObject, eventdata, handles)
set(handles.hint,"Visible","off");
se=ones(3,3);
handles.se=se;
[img_name,img_path]=uigetfile({'*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.png'},"ѡ��ͼƬ");
if img_name==0
    return
end
img=imread([img_path,img_name]);
imgInfo=imfinfo([img_path,img_name]);
handles.imgInfo=imgInfo;
% ����imgInfo
axes(handles.img_zone);
imshow(img);
pos=get(handles.img_zone,'pos');
pos(1:4)=[450-imgInfo.Width/2 350-imgInfo.Height/2  imgInfo.Width imgInfo.Height];
set(handles.img_zone,'pos',pos);

handles.rawImg=img;
handles.new_img=img;
handles.img_name=img_name;
handles.img_path=img_path;
% ������Ϣ���
% imgFields=fieldnames(imgInfo);
% infoCell=cell(length(imgFields),2);
% for i=1:length(imgFields)
%     value=getfield(imgInfo,imgFields{i});
%     infoCell{i,1}=imgFields{i};
%     infoCell{i,2}=value;
% end
% 
% set(handles.infoTable,'Data',infoCell);

guidata(hObject,handles);
% hObject    handle to open_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveImg_ClickedCallback(hObject, eventdata, handles)
new_img=handles.new_img;
img_path=handles.img_path;
img_name=handles.img_name;
imwrite(new_img,[img_path img_name]);
%д��ͼƬ������ʾ�ѱ�����Ϣ
msgbox("�ѱ���","��ʾ");
% hObject    handle to saveImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function addNoise_Callback(hObject, eventdata, handles)
img=handles.new_img;
[index,tf]=listdlg("ListString",{'��������','��˹������','�ߵ�����','��������'},"Name","ѡ������","SelectionMode","Single","ListSize",[200 130]);
%����������벻ͬ������
if index==1
    new_img=imnoise(img,'salt & pepper');
elseif index==2
    new_img=imnoise(img,'gaussian');
elseif index==3
    new_img=imnoise(img,'speckle');
elseif index==4
    new_img=imnoise(img,'poisson');
end
imshow(new_img);
handles.new_img=new_img;
guidata(hObject,handles);
% hObject    handle to addNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function gaussianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to gaussianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
sz=inputdlg('������ģ���С','ģ�崴��',[1 40]);
s=str2double(sz);
h=fspecial('gaussian',s);
img=imfilter(img,h);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);

% --------------------------------------------------------------------
function motionFilter_Callback(hObject, eventdata, handles)
% hObject    handle to motionFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img=handles.new_img;
sz=inputdlg({'�����볤��','������Ƕ�'},'ģ�崴��',[1 40]);
s=str2double(sz);
h=fspecial('gaussian',s(1,1),s(2,1));
img=imfilter(img,h);
imshow(img);
handles.new_img=img;
guidata(hObject,handles);
