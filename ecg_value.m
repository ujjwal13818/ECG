clc; close all; clear all;

% Load the .mat file
filename = 'E:\Dataset\Dataset\100m.mat'; % Replace with your file name
data = load(filename);

% Display the variables in the file
disp('Variables in the .mat file:');
disp(fieldnames(data));

% Assuming the ECG data is stored in a variable named 'val'
% Replace 'val' with the actual variable name in your .mat file
if isfield(data, 'val')
    ecg_data = data.val; % Extract the ECG data
    disp('ECG data loaded successfully.');
    
    % Display some basic information
    disp(['Number of ECG samples: ', num2str(length(ecg_data))]);
    
    % Define sampling frequency (replace with the actual value)
    Fs = 360; % Samples per second (Hz)
    
    % Duration to plot (in seconds)
    plot_duration = 0.08; % 0.05 seconds
    
    % Calculate the number of samples for the given duration
    num_samples = round(Fs * plot_duration);
    
    % Extract data for the specified duration
    ecg_short = ecg_data(1:num_samples);
    
    % Create a time vector for plotting
    t = (0:num_samples-1) / Fs; % Time in seconds
    
    % Plot the ECG signal for the specified duration
    figure;
    plot(t, ecg_short);
    title('ECG Signal (First 0.05 Seconds)');
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    grid on;
else
    disp('The variable "val" does not exist in the .mat file. Check the file structure.');
end
