function [newImg] = binaryImg(img,g)
%BINARYIMG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
sz=size(img);
newImg=zeros(sz);
for i=1:sz(1)
    for j=1:sz(2)
        if img(i,j)>g
           newImg(i,j)=1;
        end
    end
end
end

