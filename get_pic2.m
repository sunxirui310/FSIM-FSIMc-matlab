clear;
clc;                       %�����ǰ������
format long;
f1 = 'C:\Users\ada\Desktop\FSIM\xianjin\original_images\';
f2 = 'C:\Users\ada\Desktop\FSIM\xianjin\style2paints\';
folder1 = dir(f1); % ��ʾtrain�ļ����µ��ļ����ļ���
folder2 = dir(f2);
p = 0.0;
pc = 0.0;
for i = 1 : length(folder1)-2          %����f1�ļ����µ��ļ����ļ���
    file1 = strcat(f1,folder1(i+2).name);           %���ļ���·��
    file2 = strcat(f2,folder2(i+2).name);
    image1 = imread(file1);                           %��ȡͼƬ��Ϣ
    image2 = imread(file2);
    image2 = imresize(image2,[512 512]);
    [p1, p2] = FSIM(image1, image2);
    p=p+p1;
    pc=pc+p2;
    %imageDeel = imresize(imagedata,[20 20]);               ����ͼƬ������20*20����
    %picSaveName = strcat(fileName,'/d',num2str(j),'.jpg');  �����ź��ͼƬ�Ĵ洢·��
    %delete(picName);                       ��ɾ������ǰ��ԭ�ļ�
    %imwrite(imageDeel,picSaveName);        ���洢���ź��ͼƬ
    %imshow(imageDeel);                     ����ʾͼƬ
end
sprintf('FSIM: %f,  FSIMc: %f', p/6.0,pc/6.0)
