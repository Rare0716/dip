function [] = show_in_img(F)
%SHOW_IMG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
F=fftshift(F);
f=abs(F);
f=log10(f+1);
fai=angle(F);
T=1;
sz=size(F);
if numel(sz)>2
    T=sz(3);
end
figure("Name","��ɢ�任","NumberTitle","off");
for zone=1:T
    zone1=subplot(2,T,zone);
    imshow(f(:,:,zone));
    title(zone1,"����ͼ");
    zone2=subplot(2,T,T+zone);
    imshow(fai(:,:,zone));
    title(zone2,"��λͼ");
end
end

