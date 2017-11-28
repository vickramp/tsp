clear all
clc
n=input('enter number of points');
if n<2
    disp('invalid input');
	return;
end
for i=1:n
    for j=1:n
        a(i,j)=input(strcat('a[',int2str(i),'][',int2str(j),']'));
    end
end
k=1;
genes=40+n*n;
for i=1:genes
    tmp=randperm(n-1);
    for j=1:n-1
        pop(i,j,k)=tmp(j)+1;
    end
end
min(k)=short(pop,a,n,k,genes);
k=k+1;
while(true)
    pop=generatenewpop(pop,n,k,genes,a);
    min(k)=short(pop,a,n,k,genes);
   if(min(k)>=min(mod(k,2)+1))
        k=mod(k,2)+1;
        break;
   end
   k=mod(k,2)+1;
end
q=print(pop,a,n,k,genes);
