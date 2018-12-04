function cannyedge()
FileList3 = dir(fullfile('wangselect', '*.jpg'));
F3 = natsortfiles({FileList3.name});
for iFile = 1:numel(F3)
  File3 = fullfile('wangselect', F3(iFile));
  Img3  = imread(cell2mat(File3));
  [H S V]=rgb2hsv(Img3);
  a=edge(V,'Canny');
  b=hsv2rgb(H,S,a);
  filename3=sprintf('wangselectedge/myimage%02d.jpg',iFile);
  imwrite(b,filename3);
end
end