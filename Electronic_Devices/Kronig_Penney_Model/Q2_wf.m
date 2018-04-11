close all
clear all
clc

hbar = 1.055e-34;      % J.s
eV = 1.602e-19;         % C
m0 = 9.109e-31;        % kg                   

b = 4.0e-10; 
a = 1.0e-10;
d = a + b; 
U0 = 5*eV;

% Psi======================================
x=linspace(0,d*1e10,2001);
r=x(2)-x(1);
N=2001;
c= (-1)*((hbar)^2)/(2*m0*((r*1e-10)^2));
H = zeros(N-1,N-1);
D = zeros(N-1,N-1);
Um = zeros(N-1,N-1);

% Um MATRIX =======================================
    for i=1:ceil(b*1e10/r+1)
        Um(i,i)= U0;
    end
    
% D MATRIX =======================================
    for i=2:N-2
        D(i,i-1)= 1;
        D(i,i)= -2;
        D(i,i+1)= 1;
    end

    D(1,1)=-2;
    D(1,2)=1;
    D(1,N-1)=1;
    
    D(N-1,N-1)=-2;
    D(N-1,N-2)=1;
    D(N-1,1)=1;
    
% Em MATRIX =======================================
    Em = .5*U0*eye(N-1);
    
% H MATRIX =======================================
    H=c*D+Um-Em;
    TestE=eig(c*D+Um)/eV;
    [T,S,V] = svd(H,'econ'); %finding null space from Single Value Decomposition
    E=(.5*U0+S(N-1,N-1))/eV;
    if S(N-1,N-1)>.001*eV
        disp('No waveform')
    end
    ps = V(:,size(H,2));     
    ps2=ps.*ps;
    
% Potential Well================================
X=linspace(0,(10*d*1e10),20000);
U=(U0/(2*eV))*square(2*pi/(d*1e10)*X,100*b/d)+(U0/(2*eV));

psi=repmat(.5*U0/eV-50*mean(ps)+50*ps,10); %50 scaling factor to make psi visible
% psi2=repmat(.5*U0/eV+300*ps2,10); %500 scaling factor to make psi2 visible
   
%========================================= 
figure
plot(X,U)

% ts2=sprintf('|\\psi|^{2} for E= %.4feV (%.4f)U_{0} for U0=%.2feV', E,E*eV/U0,U0/eV);
ts1=sprintf('\\psi for E= %.4feV (%.4f)U_{0} for U0=%.2feV', E,E*eV/U0,U0/eV);
% title(ts2,'fontweight','bold','fontsize',14)
title(ts1,'fontweight','bold','fontsize',14)
xlabel('x in A^{o}');              
ylabel('E in units of eV'); 
ylim([-.5*U0/eV 1.5*U0/eV]);
xlim([-1*d*1e10 11*d*1e10]);
hold on;
Eline = refline([0 .5*U0/eV]);
set(Eline,'Color','g');
hold on;
plot(X,psi)
hold off;



 