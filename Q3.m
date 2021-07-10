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
controllability_matrix = [B,A*B,A^2*B,A^3*B];
rank_controllability_matrix = rank(controllability_matrix);
visibility_matrix = [C;C*A;C*A^2;C*A^3];
rank_visibility_matrix = rank(visibility_matrix);