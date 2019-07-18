function [newImg,g] = iter(img)
%ITERATION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
sz=size(img);
M=sz(1);
N=sz(2);
if numel(sz)~=2
    img=rgb2gray(img);
end
%maxScale=max(max(img));
%minScale=min(min(img));
%g=uint8((maxScale+minScale)/2);
g=128;%ֱ��ȡ��Ϊ�򵥣����ǿ������ӵ�������
while 1
    foreCount=0;
    foreSum=0;
    backCount=0;
    backSum=0;
    for i=1:M
        for j=1:N
            if img(i,j)<=g
                foreCount=foreCount+1;
                foreSum=foreSum+double(img(i,j));
            else
                backCount=backCount+1;
                backSum=backSum+double(img(i,j));
            end
        end
    end
    foreAver=foreSum/foreCount;
    backAver=backSum/backCount;
    newG=uint8(foreAver/2+backAver/2);
    if newG==g
        break
    end
    g=newG;
end
newImg=binaryImg(img,g);
%imshow(newImg);
end
