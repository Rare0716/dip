function [se] = makeLine()
%MAKERECTANGLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res=inputdlg({'�����볤��','������Ƕ�'},'����ṹԪ��',[1 45],{'3','0'});
res=str2double(res);
len=res(1,1);
deg=res(2,1);
se=strel('line',len,deg);
end

