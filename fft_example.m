n = 0:29; % 30 samples
Fs = 20; % 20hz sampling frequency
Ts = 1 / Fs;
t = n * Ts;
Fc1 = 2; % Hz
Phi1 = 1.2;
Fc2 = 6; % Hz

x = 5*cos(2*pi*Fc1*t+Phi1) + 2*sin(2*pi*Fc2*t); % sampled signal

figure(1);
clf;
subplot(4,1,1);
stem(n,x,'.','LineWidth',1.5,'MarkerSize',15);
hold on;
plot(n,x,'Color',[1 1 1]*0.6);
xlabel('n'); ylabel('x[n]');

y = fft(x);

subplot(4,1,2);
N = length(y);
k = 0:N-1;
stem(k,abs(y),'.','LineWidth',1);
xlabel('k [-]'); ylabel('|X[k]|');
ylim([0 90]); grid on;

subplot(4,1,3);
N = length(y);
k = 0:N-1;
f = k/N*Fs;
stem(f,abs(y),'.','LineWidth',1);
xlabel('f [Hz]'); ylabel('|X(f)|');
ylim([0 90]); grid on;

subplot(4,1,4);
n_fft = 200;
y2 = fft(x, n_fft);
k = 0:n_fft-1;
f = k/n_fft * Fs;
stem(f,abs(y2),'.','LineWidth',1);
hold on;
plot(f,abs(y2),'LineWidth',1);
xlabel('f [Hz]'); ylabel('|X(f)|');
ylim([0 90]); grid on;






