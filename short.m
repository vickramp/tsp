%need inspection
function c=short(pop,a,n,k,genes)
mn=999999;
for i=1:genes
min=0;
    for j=1:n-1
        tmp(j)=pop(i,j,k);
    end
    min=min+a(1,tmp(1))+a(tmp(n-1),1);
    for j=1:n-2
    min=min+a(tmp(j),tmp(j+1));
    end
    if(mn>min)
        mn=min;
    end
end
c=mn;
