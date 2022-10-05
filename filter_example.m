fs = 1e3; % Hz
Ts = 1 / fs; % s
T = 0.5; % s
t = 0:Ts:T;

f = t*fs/(4*T); % Hz
x = sin(2*pi*f.*t);
N = length(x);
X = fft(x);


% LPF
f_cutoff = 200;
k = round(f_cutoff/fs*N);

H = zeros(1,N);
H(0+1:k+1) = 1;
H(N-k+1:end) = 1;

Y = X.*H;
y = ifft(Y);

figure(1);
subplot(3,2,1);
plot(t,x); xlabel('t [s]'); ylabel('x[n]'); title('Signal');
subplot(3,2,2);
plot(abs(X)); xlabel('k [-]'); ylabel('|X[k]|'); title('Spectrum');
subplot(3,2,[3 4]);
plot(abs(H)); xlabel('k [-]'); ylabel('|H[k]|'); title('Filter'); ylim([-0.1 1.1]);
subplot(3,2,6);
plot(abs(Y)); xlabel('k [-]'); ylabel('|Y[k]|'); title('Filtered Spectrum');
subplot(3,2,5);
plot(t, y); xlabel('t [s]'); ylabel('y[n]'); title('Filtered Signal');
