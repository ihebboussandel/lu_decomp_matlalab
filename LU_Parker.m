function[L,U,X]=LU_Parker(A,B)
[m n]=size(A);
if (m ~= n )
disp ( 'LR2 error: Matrix must be square' );
return;
end;
    % Part 2 : Decomposition of matrix into L and U
  L=zeros(m,m);
  U=zeros(m,m);
  for i=1:m
  % Finding L
  for k=1:i-1
  L(i,k)=A(i,k);
  for j=1:k-1
  L(i,k)= L(i,k)-L(i,j)*U(j,k);
  end
  L(i,k) = L(i,k)/U(k,k);
  end
  % Finding U
  for k=i:m
  U(i,k) = A(i,k);
  for j=1:i-1
  U(i,k)= U(i,k)-L(i,j)*U(j,k);
  end
  end
  end
  for i=1:m
  L(i,i)=1;
  end
  % Program shows U and L
  U
  L
  % Now use a vector y to solve 'Ly=b'
  y=zeros(m,1);
  y(1)=B(1)/L(1,1);
  for i=2:m
  y(i)=-L(i,1)*y(1);
  for k=2:i-1
  y(i)=y(i)-L(i,k)*y(k);
  y(i)=(B(i)+y(i))/L(i,i);
  end;
  end;
% Now we use this y to solve Ux = y
x=zeros(m,1);
x(1)=y(1)/U(1,1);
for i=2:m
x(i)=-U(i,1)*x(1);
for k=i:m
      x(i)=x(i)-U(i,k)*x(k);
      x(i)=(y(i)+x(i))/U(i,i);
end;
   end