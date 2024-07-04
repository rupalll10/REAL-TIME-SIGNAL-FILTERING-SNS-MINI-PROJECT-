audio_file_path =("WhatsApp Ptt 2023-09-22 at 11.06.50 AM.ogg");
% Read the audio file from your PC
[audio_signal, fs] = audioread(audio_file_path);
% Design an IIR filter (low pass Butterworth filter)
order = 4; % Filter order
cutoff_frequency = 1000; % Cutoff frequency of the filter (Hz)
[b, a] = butter(order, cutoff_frequency / (fs/2), 'low');
% Apply the IIR filter to the audio signal
filtered_signal = filter(b, a, audio_signal);
% Analyze the original and filtered signals
t = (0:length(audio_signal) - 1) / fs;
figure;
subplot(2, 1, 1);
plot(t, audio_signal);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(2, 1, 2);
plot(t, filtered_signal);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
% Play the original and filtered signals
sound(audio_signal, fs); % Play the original signal
pause(length(audio_signal) / fs); % Pause for the duration of the audio
sound(filtered_signal, fs); % Play the filtered signal