function [se] = makeDiamond()
%MAKEDIAMOND �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res2=inputdlg({'���������ĵ�����ĳ���'},'���νṹԪ��',[1 45],{'3'});
res2=str2double(res2);
len=res2(1,1);
se=strel('diamond',len);
end

