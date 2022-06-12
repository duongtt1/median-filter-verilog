[f p fi]=uigetfile({'*tif';'*jpg'}, 'Chon hinh');
Iim1 = imread([p f]);
Iim1 = rgb2gray(Iim1);
Iim1 = imresize(Iim1,[400 400]);
imshow(Iim1);

fid = fopen('img.txt','w');
for i = 1:400
    for j = 1:400
        fprintf(fid,'%s',dec2bin(Iim1(i,j)));
        fprintf(fid, '\n');
    end
end