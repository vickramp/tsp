function pop=generatenewpop(pop,n,k,genes,a)   
for i=1:genes
x=randint(1,1,[1,genes]);
    while(true)
        y=randint(1,1,[1,genes]);
       if (x~=y)
           break;
       end
    end
    mid=int32((n-1)/2);
    for l=1:n
        yy(l)=-1;
    end
for l=1:mid   
     yy(l)=pop(int32(x),l,mod(k,2)+1);
end
 for l=mid+1:n-1
    yy(l)=pop(int32(y),l,mod(k,2)+1); 
 end
 for l=2:n
    tmp(l)=1;
    t1(l)=-1;
    t2(l)=-1;
 end
 for l=1:n-1
    if (tmp(yy(l))==1)
        tmp(yy(l))=tmp(yy(l))+1;
        t1(yy(l))=l;
    elseif (tmp(yy(l))==2)
            tmp(yy(l))=tmp(yy(l))+1;
        t2(yy(l))=l;
    end 
 end
 for l=2:n
     if (tmp(l)==1)
       for m=2:n
          if(tmp(m)==3)
           t=randint(1,1,[0,1]);
       if(t==0)
         yy(t1(m))=l;
       else
         yy(t2(m))=l;
       end
         tmp(m)=2;
         tmp(l)=2;
         break;
       end
   end
    end
 end
 mk1=0;
 mk2=0;
    mk1=mk1+a(1,yy(1))+a(yy(n-1),1);
    mk2=mk2+a(1,pop(i,1,mod(k,2)+1))+a(pop(i,n-1,mod(k,2)+1),1);
    for j=1:n-2
        mk1=mk1+a(yy(j),yy(j+1));
        mk2=mk2+a(pop(i,j,mod(k,2)+1),pop(i,j+1,mod(k,2)+1));
    end
    for l=1:n-1
        if mk1<mk2
                 pop(i,l,k)=yy(l);
        else
                 pop(i,l,k)=pop(i,l,mod(k,2)+1);
        end
    end

end