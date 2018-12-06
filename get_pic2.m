clear;
clc;                       %清除以前的数据
format long;
f1 = 'C:\Users\ada\Desktop\FSIM\xianjin\original_images\';
f2 = 'C:\Users\ada\Desktop\FSIM\xianjin\style2paints\';
folder1 = dir(f1); % 显示train文件夹下的文件和文件夹
folder2 = dir(f2);
p = 0.0;
pc = 0.0;
for i = 1 : length(folder1)-2          %遍历f1文件夹下的文件和文件夹
    file1 = strcat(f1,folder1(i+2).name);           %子文件夹路径
    file2 = strcat(f2,folder2(i+2).name);
    image1 = imread(file1);                           %读取图片信息
    image2 = imread(file2);
    image2 = imresize(image2,[512 512]);
    [p1, p2] = FSIM(image1, image2);
    p=p+p1;
    pc=pc+p2;
    %imageDeel = imresize(imagedata,[20 20]);               ％将图片放缩到20*20像素
    %picSaveName = strcat(fileName,'/d',num2str(j),'.jpg');  ％缩放后的图片的存储路径
    %delete(picName);                       ％删除缩放前的原文件
    %imwrite(imageDeel,picSaveName);        ％存储缩放后的图片
    %imshow(imageDeel);                     ％显示图片
end
sprintf('FSIM: %f,  FSIMc: %f', p/6.0,pc/6.0)
