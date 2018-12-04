% query=imread('query.jpg');
% querygray=rgb2gray(imread('query.jpg'))
% imshow(querygray);
% imwrite(querygray,'querygray.jpg');
   Img3  = imread('querygray.jpg');
  [H S V]=rgb2hsv(Img3);
  a=edge(V,'Canny');
  b=hsv2rgb(H,S,a);
  imwrite(b,'queryedge.jpg');