function [new_img] = img_subtract(img1_path,img2_path)
%IMG_ADD �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
img1=imread(img1_path);
size1=size(img1);

img2=imread(img2_path);
size2=size(img2);

height=min(size1(1),size2(1));
width=min(size1(2),size2(2));
new_img=img1;
if ndims(img1) ~= ndims(img2)
    warndlg('��ɫͼƬ���ܺͻҶ�ͼƬ�������ʾ��һ��ͼƬ');
    new_img=img1;
    return
else
    for tunnel=1:ndims(img1)
        for i=1:height
            for j=1:width
                new_img(i,j,tunnel)=0;
                new_img(i,j,tunnel)=img1(i,j,tunnel)-img2(i,j,tunnel);
            end
        end
    end        
end
new_img=uint8(new_img);
end

