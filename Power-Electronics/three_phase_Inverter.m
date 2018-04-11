N=1800;
R=400;
L=1;
T=1/50;

% D MATRIX =======================================

d =  (R - L*N/T) *ones(1800,1);
D = diag(d);
D(1800,1) = L*N/T;
for i=1:N-1
    D(i,i+1) = L*N/T;
end 


Vao = ones(N,1);
Vbo = ones(N,1);
Vco = ones(N,1);

Vao([901:1800]) = -1;
Vbo([1:600]) = -1;
Vbo([1501:1800]) = -1;
Vco([301:1200]) = -1;

Vno =  (Vao + Vbo + Vco)/3;
Van=220*(Vao - Vno);

i=D\Van;

figure
subplot(2,1,1) 
plot(Van);
%hold on;
subplot(2,1,2) 
plot(i);
