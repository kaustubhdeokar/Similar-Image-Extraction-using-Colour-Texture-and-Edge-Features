function similarity(array2,array3)
normarray2=[];
normarray2=(array2 - min(array2))./(max(array2)-min(array2))

normarray3=[];
normarray3=(array3 - min(array3))./(max(array3)-min(array3))

array4=[];
array4 = normarray2./2 + normarray3./2

array5=[];
array5=sort(array4)

FileList4 = dir(fullfile('wangselect', '*.jpg'));
F4 = natsortfiles({FileList4.name});

for i=1:10
r=find(array4==array5(i));
figure(i)
File4 = fullfile('wangselect', F4(r));
    imshow(cell2mat(File4));
end
end