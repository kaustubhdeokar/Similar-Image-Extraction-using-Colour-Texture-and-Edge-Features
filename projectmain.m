mkdir wangsame
mkdir wangselect
mkdir wangselectgray
mkdir wangselectedge

resize();

FileList1 = dir(fullfile('wangsame', '*.jpg'));
F1 = natsortfiles({FileList1.name});
nBand=1;
meanEachImage=arrayfun(@(x) mean(reshape(imread(cell2mat(fullfile('wangsame',F1(x)))),[],nBand)), (1:numel(F1))','UniformOutput',false);
query = imread('query.jpg');
meanofquery =int16(mean2(query));
sdofquery = int16(std2(query));
%lc and hc
lowrange=meanofquery-sdofquery;
highrange=meanofquery+sdofquery;
array1=int16([]);



for i=1:1000
    if(lowrange<cell2mat(meanEachImage(i)) && cell2mat(meanEachImage(i))<highrange)
        array1=[array1,meanEachImage(i),i];
        a=imread(cell2mat(fullfile('wangsame',F1(i))));
        f=rgb2gray(imread(cell2mat(fullfile('wangsame',F1(i)))));
        filename = sprintf('wangselect/myimage%02d.jpg',i);
        filename1 = sprintf('wangselectgray/mygrayimage%02d.jpg',i);
        imwrite(a,filename)
        imwrite(f,filename1)
    end
end
array2=lbpfeature();
cannyedge();
array3=edgefeature();
similarity(array2,array3);