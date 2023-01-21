clear all
close all
clc

% Q1:

[x,fe]=audioread('C:\Users\Rabab\Downloads\VID-20230120-WA0057.mp4');

% Q2:

sound(x,fe)
plot(x)

% Q3:

%  la fréquence d’échantillonnage * 2
sound(x,fe*2)
% la fréquence d’échantillonnage / 2
sound(x,fe/2)
%  la fréquence d’échantillonnage 
sound(x,fe)


% Q5:
%La segmentation du premier mot " Rien ne sert"
riennesertde=x(1025:(2.05e05));
stem(riennesertde)
sound(riennesertde,fe)


% Q6:

%La segmentation de toute la phrase en créant les variables suivantes :


%        courir
courir=x((2.239e+05):(2.642e+05));
sound(courir,fe)
%       ilfaut
ilfaut=x((2.987e+05):(3.81e+05));
sound(ilfaut,fe)
%      partirapoint
partirapoint=x((4e+05):(5.28e+05));
sound(partirapoint,fe)



% Q7:
% Le rearrangement de ce vecteur pour écouter la phrase synthétisée « Rien ne sert de partir à point, il faut courir ». 
parole=[riennesertde ,partirapoint ,ilfaut,courir];
sound(parole,fe)
