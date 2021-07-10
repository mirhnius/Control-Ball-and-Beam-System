m = 0.11;
g = 9.84;
j = 19*10^(-3);
jb = 9.99*10^(-6);
p0 = 0;

r = 159/9999;
A = [0,1,0,0;0,0,(-1*m*g/(jb/r^2+m)),0;0,0,0,1;((-1*m*g)/(m*p0^2+j)),0,0,0];
B = [0;0;0;(1/(m*p0^2+j))];
C = [1 0 0 0];
D = 0;
[b,a] = ss2tf(A,B,C,D);
s = tf('s');
G = -b(5)/(s^4+a(5));  

s = tf('s');
G2 = b(5)/( (s+sqrt(sqrt(-1*a(5))))*(s^2+sqrt(-a(5))) );
k = 0.13;
CG1 = k*G2/(1+k*G2) ;
b2=[-49.54 , - 223.2 , - 1006 ,- 4533];
a2=[1, 9.013 ,60.93,316.5   , 1014 , 2711 , 3843];
[A2,B2,C2_prime,D2]=tf2ss(b2,a2);
C2=eye(6);
figure
for i =1:6
    subplot(3,2,i);
    sys = ss(A2,B2,C2(i,:),D2);
    step(sys);
    xlabel('t');
    ylabel("x"+num2str(i));
    title("x"+num2str(i)+"(t)");
end
k = -10^(-10);
CG1 = k*G2/(1+k*G2) ;
b2=[3.81e-08 , 1.717e-07 , 7.738e-07 , 3.487e-06];
a2=[ 1 ,9.013 , 60.93 , 366.1 ,1237,  3717 , 8376];
[A2,B2,C2_prime,D2]=tf2ss(b2,a2);
C2=eye(6);
figure
for i =1:6
    subplot(3,2,i);
    sys = ss(A2,B2,C2(i,:),D2);
    step(sys);
    xlabel('t');
    ylabel("x"+num2str(i));
    title("x"+num2str(i)+"(t)");
end