function [A_k S] = task3(image, k)
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
  Z = A'/sqrt(n-1);
  [U,S,V]=svd(Z);
  W = zeros(m,k);
  for i = 1:k
    W(:,i) = V(:,i)';
  endfor
  Y = W'*A;
  A_k = W*Y + miu;
  %imshow(uint8(A_k));
endfunction