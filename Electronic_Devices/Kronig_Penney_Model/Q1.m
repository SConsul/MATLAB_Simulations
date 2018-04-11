close all
clear all
clc

% CONSTANTS =======================================
hbar = 1.055e-34;      % J.s
eV = 1.602e-19;         % C
me = 9.109e-31;        % kg
%no of eigen values=N-2
N=1002;
x = linspace(-10,10,N);
H = zeros(N-2,N-2);
D = zeros(N-2,N-2);
U = zeros(N-2,N-2);
E = zeros(1,N-2); 
%U= (3*x + 7*x.^4 + x.^2 + 2)*eV;
%plot(x,U)

r=x(2)-x(1);
c= (-1)*((hbar)^2)/(2*me*(r^2));

% D MATRIX =======================================
D(1,1)=-2;
D(1,2)=1;
D(N-2,N-2)=-2;
D(N-2,N-3)=1;
for i=2:N-3
        D(i,i-1)= 1;
        D(i,i)= -2;
        D(i,i+1)= 1;
end
% U MATRIX =======================================

for i=1:N-2
    U(i,i)= (3*x(1,i+1) + 7*x(1,i+1)^4 + x(1,i+1)^2 + 2)*eV;
end

% H MATRIX =======================================
H=c*D+U;

% E =======================================
e = eig(H)/eV
