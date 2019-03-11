function [x, xmin, fmin] = incerc(a1, b1,epsilon)
    
    f=@(x)(x*x*x*x + x*x*x + 5*x*x + x +2)

    alfa = (sqrt(5)-1)/2
    landa(1,1) = a1 + (1-alfa)*(b1-a1)
    miu(1,1) = a1 + alfa*(b1-a1)
    
    f_landa(1,1)=feval(f,landa(1,1))
    f_miu(1,1)=feval(f,miu(1,1))
    
    a(1,1)=a1
    b(1,1)=b1
    k=1
    
    while (b(1,k) - a(1,k) > epsilon)
        if(feval(f,landa(1,k)) > feval(f,miu(1,k)))
            a(1,k+1)=landa(1,k);
            b(1,k+1)=b(1,k);
            landa(1,k+1)=miu(1,k)
            miu(1,k+1)=a(1,k+1)+alfa*(b(1,k+1)-a(1,k+1))
            f_landa(1,k+1)=f_miu(1,k);
            f_miu(1,k+1)=feval(f,miu(1,k+1));
        else
            a(1,k+1)=a(1,k);
            b(1,k+1)=miu(1,k);
            miu(1,k+1)=landa(1,k);
            landa(1,k+1)=a(1,k+1)+(1-alfa)*(b(1,k+1)-a(1,k+1));
            f_landa(1,k+1)=feval(f,landa(1,k+1));
            f_miu(1,k+1)=f_landa(1,k);
        end
        
        
        %a=a(1,k);
        %b=b(1,k);
        %t=[a,b]
        
       % plot(k*ones(size(t),t))
        
        
        k=k+1;
        %plot([k,k],[a(1,k),b(1,k)])
    end
    figure(1)
    plot(a)
        hold on;
        plot(b)

[unu,t]=size(a)
%x=((a(1,t)+b(1,t))/2)
xmin=(a(1,t)+b(1,t))/2
fmin=feval(f,xmin)
figure(2)
fplot(f,[-3,3])
end