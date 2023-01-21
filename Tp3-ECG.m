clear all
close all
clc

load("ecg.mat");
x=ecg;

fs=500;
N=length(x)
ts=1/fs
%%tracer ECG en fonction de temps
t=(0:N-1)*ts;
subplot(2,2,1)
plot(t,x);
title("le signal ECG");
%%le spectre Amplitude
 y = fft(x);
 f = (0:N-1)*(fs/N);
 fshift = (-N/2:N/2-1)*(fs/N);

subplot(2,2,2)
plot(fshift,fftshift(abs(y)))
title("spectre Amplitude")

%%spectre Amplitude centré


%%suppression du bruit des movements de corps

h = ones(size(x));
fh = 0.5;
index_h = ceil(fh*N/fs);
h(1:index_h)=0;
h(N-index_h+1:N)=0;

ecg1_freq = h.*y;
ecg1 =ifft(ecg1_freq,"symmetric");
subplot(223)
plot(t,ecg);
title("signal filtré")
subplot(224)
plot(t,ecg1);

 %Elimination interference 50 hz
 
 
Notch = ones(size(x));
fcn = 50;
index_hcn = ceil(fcn*N/fs)+1;
Notch(index_hcn)=0;
Notch(index_hcn+2)=0;

ecg2_freq = Notch.*fft(ecg1);
ecg2 =ifft(ecg2_freq,"symmetric");
subplot(211)
plot(t,ecg);
xlim([0.5 1.5])
title("signal filtré")
subplot(212)
plot(t,ecg2);
xlim([0.5 1.5])

%%
pass_bas = zeros(size(x));
fcb = 30;
index_hcb = ceil(fcb*N/fs);
pass_bas(1:index_hcb)=1;
pass_bas(N-index_hcb+1:N)=1;

ecg3_freq = pass_bas.*fft(ecg2);
ecg3 =ifft(ecg3_freq,"symmetric");
subplot(211)
plot(t,ecg,"linewidth",1.5);
xlim([0.5 1.5])
subplot(212)
plot(t,ecg-ecg3);
xlim([0.5 1.5])

%%
[c,lags] = xcorr(ecg3,ecg3);
stem(lags/fs,c)