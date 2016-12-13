T = 40; 
wo = 2*pi/T;			
C0 = 16/1600;				
t = -80:0.01:80;				
N = 50;			
% 50 coeficienti
x = C0*ones(size(t));		
   
   for k = 1:N,			
      Xk =2*(exp(-j*k*wo*4)*(-4*j*k*wo+exp(4*j*wo*k)-1))/(j*j*k*k*wo*wo*T*T);       
      %integrala pentru o functie 
      % f={-2A*t/T), pt t intre 0 si 4, 0 in rest 
      
      %semnalul reconstruit
      x = x + real(Xk*exp(j*k*wo*t));	
   end;
   

plot(t,x,':');			
hold on;
plot([ -80 -74 -74 -40 -34 -34 0 6 6 40 46 46 80],[ 0 0.29 0 0 0.29 0 0 0.29 0 0 0.29 0 0   ],'-'); 
%semnalul initial
hold off;
hold off;
titlevec = ['Semnalul x(t) n= ' num2str(1),',..,',num2str(N)];
title(titlevec);
 
clear;					
figure(2); clf;			

T = 4; wo = 2*pi/T;			

D0 = 0.5;				

i = 1;					

for k = 1:50,				
   Xk(i) = j/(2*pi*k)                  
   w(i) = k*wo;				
	i = i + 1;			
end;

Xk(i) = D0
w(i) = 0;	
i = i + 1;				
for k = -50:1			
   Xk(i) = j/(2*pi*k)                 
   w(i) = k*wo;				
   i = i + 1;				
end;


subplot(2,1,1);				
% spectru de amplitudine
stem(w,abs(Xk),'filled');
title('Spectrul de Amplitudine');

subplot(2,1,2);				
% spectru de faza
stem(w,angle(Xk),'filled');
title('Spectru de faza');