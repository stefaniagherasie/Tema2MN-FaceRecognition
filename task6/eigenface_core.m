function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  num = ['1'; '2'; '3'; '4'; '5'; '6'; '7'; '8'; '9'; '10'];
  for i = 1:10
   image = strcat(database_path,'/', num(i,:), '.jpg');
   image_matrix = double(rgb2gray(imread(image)));
   %inlocuire cu parcurgere
   image_matrix = image_matrix';
   image_vector = image_matrix(:);
   T(:,i) = image_vector;
  endfor
  [n1, n2] = size(T);
  for i = 1:n1
    m(i,:) = sum(T(i,:))/10;
  endfor;
  A = T - m;
  B = A'*A;
  [V S] = eig(B);
  [n,n] = size(S);
  k = 1;
  for i = 1:n
    if S(i,i) > 1
      V1(:,k) = V(:,i);
      k++;
    end
  endfor 
  eigenfaces = A*V1;
  pr_img = eigenfaces' * A;
end