clear all
close all
clc

[music, fs] = audioread('test.wav');
music = music';

N = length(music);

f = (0:N-1)*(fs/N);
fshift = (-N/2:N/2-1)*(fs/N);


%la représentation du signal dans le demaine fréquetiel avant le filtrage 
spectre_music = fft(music);
subplot(121)
plot(fshift,fftshift(abs(spectre_music)));
title('Le spectre d amplitude')


k = 1;
fc = 4500;
%la transmitance complexe 
h = k./(1+1j*(f/fc).^100);

h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];


%la représentation du signal dans le demaine fréquetiel aprés le filtrage 
y_filtr = spectre_music(1:end-1).*h_filter;
sig_filtred= ifft(y_filtr,"symmetric");

% semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)

title('Diagrame de Bode ')
ylabel('Gain')
xlabel('Fréqeunce')

subplot(122)
plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))))
title('Le signal aprés le filtrage ')