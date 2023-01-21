clear all 
close all
clc

%*****   Analyse fréquentielle du chant du rorqual bleu  *****




%  La commande audioread pour lire le fichier
[x,fe]=audioread("bluewhale.au");

chant = x(2.45e4:3.10e4);

N = length(chant);
te = 1/fe;

t = (0:N-1)*(10*te);
subplot(121)
plot(t,chant)



y = abs(fft(chant)).^2/N; 
f = (0:floor(N/2))*(fe/N)/10;
subplot(122)
plot(f,y(1:floor(N/2)+1));

