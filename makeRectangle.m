function [se] = makeRectangle()
%MAKERECTANGLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res=inputdlg({'�����볤','�������'},'����ṹԪ��',[1 35;1 35],{'3','3'});
res=str2double(res);
m=res(2,1);
n=res(1,1);
se=ones(m,n);
end
