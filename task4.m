function [A_k S] = task4(image, k)
  %TODO
  A = double(imread(image));
  [m, n] = size(A);
  miu = zeros(m, 1);

  for i = 1:m
    suma = sum(A(i,:));
    miu(i,:) = suma / n;
  endfor
  for i =1:m
    A(i,:) = A(i,:) - miu(i);
  endfor
  Z = A*(A'/(n-1));
  [V S]= eig(Z);
  W = V(:,[1:k]);
  Y = W'*A;
  A_k = W*Y + miu;
  %imshow(uint8(A_k));
endfunction