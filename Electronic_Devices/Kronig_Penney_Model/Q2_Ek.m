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
 
dE = 0.01*eV;                          %dE to a small increment 
E =  0;                              
 
n=1;
 Emax=15*eV;
 while E<Emax
      alpha=sqrt(2*m0*(U0-E)/hbar^2);
      beta= sqrt(2*m0*E/hbar^2);
      F_E=cos(a*beta)*cosh(b*alpha)+(alpha^2-beta^2)/(2*alpha*beta)*sin(a*beta)*sinh(b*alpha); 
   
         if abs(F_E)<1 
            
            E1(n) = E;                              
            k(n) = acos(F_E)/d; 
            n = n+1;
 
         end 
         E=E+dE;
        
 
 end
 
scatter(k*(1e-9) , E1/eV, '*','SizeData',12);     
hold on;
scatter(-k*(1e-9) , E1/eV, '*','SizeData',12);     
xlabel('k in units of /nm');             
ylabel('E in units of eV'); 
title('E-k diagram for U_{o}=0.2eV','fontweight','bold','fontsize',14)
