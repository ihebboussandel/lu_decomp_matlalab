function[A]=facto_lu(A)
n=size(A)
for j=1:1:n-1
    for i=j+1:1:n 
        A(i,j)=A(i,j)/A(j,j);
    end
    for i=j+1:1:n
        for k=j+1:1:n
           A(i,k)=A(i,k)-A(i,j)*A(j*k);   
        end
    end
end