function [se] = makeCross()
%MAKECIRCLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res=inputdlg({'������ʮ�ְ볤'},'ʮ�ֽṹԪ��',[1 35],{'3'});
res=str2double(res);
len=res(1,1);
se=zeros(2*len+1,2*len+1);
se(:,len+1)=1;
se(len+1,:)=1;
end