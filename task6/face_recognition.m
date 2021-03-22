function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  image_matrix = double(rgb2gray(imread(image_path)));
  image_matrix = image_matrix';
  image_vector = image_matrix(:);
  
  Z = image_vector - m;
  PrTestImg = eigenfaces'*Z;
  [m, n] = size(pr_img);
  min_dist = norm(pr_img(:,1) - PrTestImg);
  [n1, n2] = size(PrTestImg);
  output_img_index = 1;
  for i = 2:n1
    dist = norm(pr_img(:,i) - PrTestImg);
    if(dist < min_dist)
      min_dist = dist;
      output_img_index = i;
    end
  endfor
end