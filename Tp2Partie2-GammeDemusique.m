clear all
close all
clc

% Synthèse d’une gamme de musique

fe=8192;
te=1/fe;
N=5000;
t=(0:N-1)*te;
Dol=10*cos(2*pi*262*t);
%sound(Dol,fe)
Re=10*cos(2*pi*294*t);
%sound(Re,fe) 
Mi=10*cos(2*pi*330*t);
%sound(Mi,fe)
Fa=10*cos(2*pi*349*t);
%sound(Fa,fa)
Sol=10*cos(2*pi*392*t);
%sound(Sol,fe)
La=10*cos(2*pi*440*t);
%sound(La,fe)
Si=10*cos(2*pi*494*t);
%sound(Si,fe)
Do2=10*cos(2*pi*523*t);
%sound(Do2,fe)
musique=[Dol,Re,Mi,Fa,Sol,La,Si,Do2];
sound(musique,fe)
 

%Q2 :

f=(0:N-1)*(fe/N);
spectre_musique=fft(musique);
signalAnalyzer(abs(fftshift(spectre_musique)));
