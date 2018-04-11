clc
clc
clear all

%PNP
q=1.602e-19;
Ne=3e24;
Nb=2e22;
Nc=1e19;
ni=1e16;
kT=(1.3807e-23)*300;

D=7.6e-2;
tau=1e-5;
L=sqrt(D*tau);
W=0.01*L;
A=1e-6;       

% VEB= linspace(-5*kT/q,5*kT/q,1000);
% VCB=0;
% Je=q*D/L*(((ni^2/Ne)+(ni^2/Nb)*cosh(W/L)/sinh(W/L))*(exp(q*VEB/kT)-1)-(ni^2/Nb)/sinh(W/L)*(exp(q*VCB/kT)-1));
% Ic=q*D/L*((ni^2/Nb)/sinh(W/L)*(exp(q*VEB/kT)-1)-((ni^2/Nc)+(ni^2/Nb)*cosh(W/L)/sinh(W/L))*(exp(q*VCB/kT)-1));
% Ib=Je-Ic;

% EB= exp(q*VEB/kT)-1;
% CB=(exp(q*VCB/kT)-1)

% for i=-4:2:4
% i=2;
        Ib=i*1e-3;
        VEB= linspace(-5*kT/q,5*kT/q,1001);
        EB= exp(q*VEB/kT)-1;
        CB=(Ib/(q*A*D/L)-((ni^2/Ne)+(ni^2/Nb)*coth(W/L))*EB+((ni^2/Nb)/sinh(W/L))*EB)/(-(ni^2/Nb)/sinh(W/L)+((ni^2/Nc)+(ni^2/Nb)*coth(W/L)));
        VCB=(kT/q)*log(CB+1);
        VEC=VEB-VCB;
        Ic=q*A*D/L*((ni^2/Nb)/sinh(W/L)*(exp(q*VEB/kT)-1)-((ni^2/Nc)+(ni^2/Nb)*cosh(W/L)/sinh(W/L))*(exp(q*VCB/kT)-1));
        plot(VEC,Ic*1e3,'color',rand(1,3))
        hold on
% end


%  scatter((VEB-VCB),Ic*1e3,'*','SizeData',12); 
% plot((VEB-VCB),Ic*1e3,'color',rand(1,3)); 
xlabel('V_{EC} in V');
ylabel('I_{C} in mA');
axh = gca; % use current axes
color = 'k'; % black, or [0 0 0]    
linestyle = ':'; % dotted
line(get(axh,'XLim'), [0 0], 'Color', color, 'LineStyle', linestyle);
line([0 0], get(axh,'YLim'), 'Color', color, 'LineStyle', linestyle);
% ylim([-3 3]);

% 
