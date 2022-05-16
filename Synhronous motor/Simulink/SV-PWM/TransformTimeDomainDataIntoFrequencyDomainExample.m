%% Transform Time-Domain Data into Frequency Domain
% This example shows how to transform time-domain data into the frequency
% domain using the FFT block. 
%
% *Note*: To open the example and the associated models, you must have
% MATLAB(R) open. Click on the *Open Script* button while you have 
% this page open on the MATLAB help browser.
% 
% Copyright 2018 The MathWorks, Inc.

%%
% Use the Sine Wave block to generate two sinusoids, one at 15 Hz and the
% other at 40 Hz. Use the Matrix Sum block to add the sinusoids
% point-by-point to generate the compound sinusoid:
%
% $u=sin(2*15 \pi t)+sin(2*40 \pi t)$
% 
% Transform this sinusoid into the frequency domain using an FFT
% block. See the |ex_fft_tut| model:
ex_fft_tut

%%
sim('ex_fft_tut')
open_system('ex_fft_tut/Array Plot')

%%
% The scope shows peaks at 15 and 40 Hz, as expected. You have now
% transformed two sinusoidal signals from the time domain to the frequency 
% domain. 
%%
% You can use a Spectrum Analyzer block in place of the sequence of FFT,
% Complex to Magnitude-Angle, MATLAB Function, and Array Plot blocks.  The
% Spectrum Analyzer computes the magnitude FFT and shifts the FFT
% internally. See the |ex_time_freq_sa| model:
ex_time_freq_sa

%%
sim('ex_time_freq_sa')
open_system('ex_time_freq_sa/Spectrum Analyzer')

%%
% The blocks in the Power Spectrum Estimation library compute the FFT
% internally.