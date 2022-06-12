k=textread('output.txt');
k=uint8(k);
img=zeros(398,398,'uint8');
idxImg=0;
for i=1:398
    for j = 1:398
        idxImg=idxImg+1;
    img(i+1,j+1)=k(idxImg);
    end
end
imshow(img);