function [se] = makeCircle()
%MAKECIRCLE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res=inputdlg({'�������ڰ뾶r','��������뾶R'},'���νṹԪ��',[1 35;1 35],{'3','5'});
res=str2double(res);
r=res(1,1);
R=res(2,1);
se=zeros(2*R+1,2*R+1);
for i=1:2*R+1
    for j=1:2*R+1
        if abs(i-R-1)+abs(j-R-1)>=r&&abs(i-R-1)+abs(j-R-1)<=R
            se(i,j)=1;
        end
    end
end
end
