function [se] = makeCircle()
%MAKECIRCLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res=inputdlg({'������뾶'},'Բ�νṹԪ��',[1 35],{'3'});
res=str2double(res);
r=res(1,1);
se=zeros(2*r+1,2*r+1);
for i=1:2*r+1
    for j=1:2*r+1
        if abs(i-r-1)+abs(j-r-1)<=r
            se(i,j)=1;
        end
    end
end
end
