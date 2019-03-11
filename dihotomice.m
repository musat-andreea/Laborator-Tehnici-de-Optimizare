function [xmin] = dihotomice (eps, delta, a, b)
    k=1;
    
    %f=@(x)(5*x*x+2)
    f=@(x)(2*x*x-x*sin(x))

    for k=1:100
        if(abs(b-a) > eps)
            landa=(a+b)/2 - delta
            miu=(b+a)/2 + delta
        end
        if(feval(f,landa) < feval(f,miu))
            b=miu
        else
            a=landa
        end
    end
    
    xmin=(a+b)/2
    
    plot(f,[-3;4])
    %[-3;4]=fplot(f)
end