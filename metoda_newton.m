function[a,b,val] = newton_varsimplificata()

x1=sym('x1');
x2=sym('x2');
f(x1,x2)=1/2*x1^2+5/2*x2^2+2*x1*x2+2*x1+4*x2
eps=0.01
g=symfun(gradient(f,[x1 x2]),[x1 x2]);
h=symfun(hessian(f,[x1 x2]),[x1 x2]);
a=1;
b=-1;
while(norm(double(feval(g,a,b)))>eps)
    g=symfun(gradient(f,[x1 x2]),[x1 x2]);
    h=symfun(hessian(f,[x1 x2]),[x1 x2]);
    H=inv(h);
    d=-g;
    y=[a b]' - H(a,b)*g(a,b);
    a=y(1);
    b=y(2);
end
a
b
z(1)=a;
z(2)=b;
val=f(z(1),z(2));
ezsurf(f,[-10,10]);
end