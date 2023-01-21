clear all
close all
clc

   % ************* TP1- Analyse spectrale d’un signal Transformée de Fourier discrète****************

fe = 1e4;
te = 1/fe;
N = 10000; 


%*** La représentation du signal dans le domaine temporel ***
t = (0:N-1)*te; 
x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
subplot(321)
plot(t,x,'.');
title(' Le signal original ')


 
%*** La représentation du signal dans le domaine fréquentiel ***

% le vecteur f qui correspond à l'échantillonnage du signal dans l'espace fréquentie
f =(0:N-1)*(fe/N); 
%Le Calcule de la TFD du signal x(t) en utilisant la commande "fft"
y = fft(x); 
%Le spectre en amplitude 
% subplot(232)
% plot(f,abs(y));
% title('Le spectre d amplitude sans décalage ')



%La fonction fftshift, qui effectue un décalage circulaire centré sur zéro
fshift = (-N/2:N/2-1)*(fe/N)
subplot(322)
plot(fshift,fftshift(2*abs(y)/N))
title('Le spectre d amplitude ')


%La généralisation du Bruit blanc gaussien
bruit = 5*randn(size(x));
subplot(234)
% plot(bruit)
% title('Le bruit')

% introduire ce bruit dans le signal d’origine x(t)
xbruit = x+bruit;
subplot(323)
plot(xbruit)
title('Le signal bruité une intensité = 5 ')



%Le calcule puis le tracage du spectre de puissance du signal bruité centré à la fréquence zéro. 
ybruit = fft(xbruit);
subplot(324)
plot(fshift,fftshift(abs(ybruit)));
title('Le spectre d amplitude du signal bruité')



bruiT = 50*randn(size(x));
xbruiT = x+bruiT;
subplot(325)
plot(xbruiT)
title('Le signal bruité une intensité = 50 ')


ybruiT = fft(xbruiT);
subplot(326)
plot(fshift,fftshift(abs(ybruiT)));
title('Le spectre d amplitude du signal bruité')

