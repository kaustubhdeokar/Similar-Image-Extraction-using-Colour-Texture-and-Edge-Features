function resize()
FileList = dir(fullfile('wang', '*.jpg'));
F = natsortfiles({FileList.name});
Result   = cell(1, numel(F));
for iFile = 1:numel(F)
  File = fullfile('wang', F(iFile));
  Img  = imread(cell2mat(File));
  J = imresize(Img, [256 256]); 
  filename2=sprintf('wangsame/myimage%02d.jpg',iFile);
  imwrite(J,filename2);
end
end