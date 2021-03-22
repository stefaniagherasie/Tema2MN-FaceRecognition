function task5()
  %TODO
  image = 'in/images/image1.gif';
  A = double(imread(image));
  [u,s,v]=svd(A);
  [n, m] = size(A);
  k = [1:19 20:20:99 100:30:min(m,n)];
  len = length(k);  
  %primul grafic
  figure(1);
  clf     
  [A_k S]= task3(image, k);
  plot(diag(S));
  title('Grafic 1');  
  
  %al 2lea grafic
  figure(2);
  clf
  sum = 0;
  sum_k = zeros(1, len);
  for i = 1:min(m,n)
     sum = sum + s(i,i);
  endfor
  for l = 1:len
   for i = 1: k(l)
     sum_k(l) = sum_k(l) + s(i,i);
   endfor
   sum_k(l) = sum_k(l) / sum;
  endfor
  plot(k, sum_k);
  title('Grafic 2');
  
  %al 3lea grafic
   figure(3);
   clf

   sum_3 = zeros(1, len);
   error = zeros(1, len);
   for l = 1:len
     [A_k S]= task3(image, k(l));
     for i = 1:n
       for j = 1:m
         sum_3(l) = sum_3(l) + (A(i,j) - A_k(i,j))^2;
       endfor
      endfor
    error(l) = sum_3(l) / (m*n);
  endfor
  plot(k,error);
  title('Grafic 3');
  
  %al 4lea grafic
  figure(4);
  clf;
  rata = zeros(1, len);
  for l = 1:len
    rata(l) = (2*k(l) + 1) / n;
  endfor
  plot(k, rata);
  title('Grafic 4');
    
end