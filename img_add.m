function [new_img] = img_add(img1_path,img2_path)
    %IMG_ADD �˴���ʾ�йش˺�����ժҪ
    %   �˴���ʾ��ϸ˵��
    prompt={'��������(1���㣬0����)','ͼһȨ��(Ĭ��0.5����ѡ��Χ0-1)','ͼ��Ȩ��(Ĭ��0.5����ѡ��Χ0-1)'};
    definput={'0','0.5','0.5'};
    input=inputdlg(prompt,"������",[1 35],definput);
    params=str2double(input);
    type=params(1);
    part1=params(2);
    part2=params(3);
    img1=imread(img1_path);
    size1=size(img1);
    img2=imread(img2_path);
    
    if type==1
        img1=double(img1);
        img2=double(img2);
    end
    
    size2=size(img2);
    height=min(size1(1),size2(1));
    width=min(size1(2),size2(2));
    new_img=img1;
    if ndims(img1) ~= ndims(img2)
        warndlg('��ɫͼƬ���ܺͻҶ�ͼƬ��ӣ���ʾ��һ��ͼƬ');
        new_img=img1;
        return
    else
        for tunnel=1:ndims(img1)
            for i=1:height
                for j=1:width
                    new_img(i,j,tunnel)=part1*img1(i,j,tunnel)+part2*img2(i,j,tunnel);
                end
            end
        end        
    end
    new_img=uint8(new_img);
end

