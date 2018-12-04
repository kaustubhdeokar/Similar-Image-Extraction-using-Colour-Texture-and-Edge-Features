function array3=edgefeature()
clc
query2=imread('queryedge.jpg');
Red = query2(:,:,1);
Green = query2(:,:,2);
Blue = query2(:,:,3);

array3=[];
FileList3 = dir(fullfile('wangselectedge', '*.jpg'));
F3 = natsortfiles({FileList3.name});

for iFile = 1:numel(F3)
    
  File3 = fullfile('wangselectedge', F3(iFile));
  Img3  = imread(cell2mat(File3));
  Red1 = Img3(:,:,1);
Green1 = Img3(:,:,2);
Blue1 = Img3(:,:,3);



C=abs(Red-Red1);
D=Red+Red1;
E=C.^2 ./D;
F=E./2
fmat=reshape(F,1,256*256);

G=abs(Green-Green1);
H=Green+Green1;
I=G.^2 ./H;
J=I./2
jmat=reshape(J,1,256*256);

K=abs(Blue-Blue1);
L=Blue+Blue1;
M=L.^2 ./L;
N=M./2
nmat=reshape(N,1,256*256);


O= [fmat jmat nmat]
P=sum(O)

array3=[array3,P];
end

















end