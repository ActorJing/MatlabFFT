clc
close all;
clear;
% 加载data.mat文件
load('data.mat');

% 绘制data变量的图形
plot(data);
% 生成信号
Fs = 1025.390625; % 采样频率
N = 10200; % 采样数
t = (0:N-1)/Fs; % 时间向量
f = (0:N-1)*(Fs/N); % 频率向量


% 进行傅里叶变换
Y = fft(data);

% 计算双边频谱
P2 = abs(Y/N);

% 计算单边频谱
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% 绘制频域图
figure;
plot(f(1:N/2+1), P1);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Domain of Data');

