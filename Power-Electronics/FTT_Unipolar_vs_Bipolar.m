fs = 1000; %Sampling Freq
t = 0 : 1/fs : 4 - 1/fs;
fm=50;
fc=500;
Am=0.5; %Modulation Index

mod1=Am*sin(2*pi*fm*t);
mod2=-Am*sin(2*pi*fm*t);

nfft=length(mod1);
nfft2=2^nextpow2(nfft);
ff=fft(mod1,nfft2);

% Define some parameters that define the triangle wave.
elementsPerHalfPeriod = fs/fc; % Number of elements in each rising or falling section.
numberOfPeriods = 32; % How many replicates of the triangle you want.

% Construct one cycle, up and down.
risingSignal = linspace(0, 2, elementsPerHalfPeriod);
fallingSignal = linspace(2, 0, elementsPerHalfPeriod);
% Combine rising and falling sections into one single triangle.
oneCycle = [risingSignal, fallingSignal(2:end-1)] -1;
x = 0 : length(oneCycle)-1;

% Now replicate this cycle several (numberOfPeriods) times.
triangleWaveform = repmat(oneCycle, [1 numberOfPeriods]);
x = 0 : length(triangleWaveform)-1;

%Bipolar PWM
for i
if(sin(i)

figure;
subplot(2,1,1);
plot(mod1);
axis([0 64 -1.5*Am 1.5*Am])
hold on; 
plot(mod2);
axis([0 64 -1.5*Am 1.5*Am])
hold on;
plot(x, triangleWaveform, '-');
hold off;

subplot(2,1,2);
plot(abs(ff));





