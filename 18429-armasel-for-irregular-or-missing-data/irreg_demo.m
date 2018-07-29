% irreg_demo
%
% demo of an irregularly sampled problem
%
% Author Piet M.T. Broersen, September 2008
%
% The three statements :
%           ****************************************************** 
%           *  [asel bsel sellog]=ARMAsel_mis(ti,xi,ARmax,Tr,w); *
%           *  psdsel=arma2psd(asel,bsel);                       *
%           *  corsel=arma2cor(asel,bsel,50);                    *
%           ****************************************************** 
%  compute the selected estimated spectrum and autocorrelation function.
%  Sellog gives additional information and plots spectra of all estimated
%  AR models
%
%  ti : observation times [s]
%  xi : observation amplitudes
%  ARmax : higherst candidate AR order
%  Tr : equidistant resampling distance [s]
%  w ; slot width as fraction of Tr [s]
%
%  If the mean sampling frequency f0 Hz is high in comparison with the highest
%  frequency in the desired spectrum, it is advisable to use
%  nearest neighbor resampling and armasel.
%  See the example in simple_irreg_demo.
%  This gives very accurate spectra until f0/20 Hz and
%  about 50 % error due to resampling at f0/2pi.
%  The error becomes very large for higher frequencies and
%  armasel_irreg is advised for spectra higher than f0/2pi Hz.

clear all, close all, clc, echo off
   
load irreg_data
% row vectors of times ti and amplitudes xi of irregularly sampled observations

N=length(ti)

figure
plot(ti,xi,'p',ti,xi,':r')
title([int2str(N),' irregular benchmark data.'])
xlabel('\rightarrow time axis [s]')
axis tight

disp('Mean time between observations')
T0=(ti(N) - ti(1))/(N-1)
   
disp(' ')
disp('************************************************************************')
disp('Some warning messages from the OPTIM toolbox cannot be suppressed easily')
disp('It is not necessary to provide gradient information')
disp('Warnings generated by the MATLAB OPTIM routine fminunc can be ignored')
disp('************************************************************************')
disp(' ')
disp('Input values for ARMAsel_irreg')
ARmax=3
w=1/2            %*Tres   slot width, fraction of Tres
Tr=1/2000
disp(' ')
disp('[air bir sellogir] = ARMAsel_irreg(ti,xi,ARmax,Tr,w)')

[air bir sellogir] = ARMAsel_irreg(ti,xi,ARmax,Tr,w)

disp('************************************************************************')
disp(' ')
disp('New input for w')
w=1/8
disp(' ')
disp('[air2 bir2 sellogir2] = ARMAsel_irreg(ti,xi,ARmax,Tr,w)')
[air2 bir2 sellogir2] = ARMAsel_irreg(ti,xi,ARmax,Tr,w)

disp('************************************************************************')
disp(' ')
disp('New input for w and Tr')
w=1/2            %*Tres   slot width, fraction of Tres
Tr2=1/4000
disp(' ')
disp('[air3 bir3 sellogir3] = ARMAsel_irreg(ti,xi,ARmax,Tr,w)')
[air3 bir3 sellogir3] = ARMAsel_irreg(ti,xi,ARmax,Tr2,w)

[h_ir f_ir] = arma2psd(air,bir,1000,Tr);
h_ir2 = arma2psd(air2,bir2,1000,Tr);
[h_ir3 f_ir3] = arma2psd(sellogir3.AR_sel_corrected,1,1000,Tr2);

disp(' ')
disp('  rc AR_sel for w = 1/2 and for w = 1/8, Tr = 0.0005 s')
[dum rc_sel]=ar2arset(sellogir.ar);
[dum rc_sel2]=ar2arset(sellogir2.ar);
[dum rc_sel3]=ar2arset(sellogir3.AR_sel_corrected);
disp(rc_sel)
disp(rc_sel2)
disp('  rc AR_sel-corrected for w = 1/2, Tr = 0.00025 s')
disp(rc_sel3)

figure
loglog(f_ir,h_ir,f_ir,h_ir2,f_ir3,h_ir3)
legend('\it{Tr}\rm = 0.0005 s,  \itw\rm = 1/2 * \it{Tr}\rm s', ...
       '\it{Tr}\rm = 0.0005 s,  \itw\rm = 1/8 * \it{Tr}\rm s', ...
       '\it{Tr}\rm = 0.00025 s, \itw\rm = 1/2 * \it{Tr}\rm s',3)
title(['PSD of ',int2str(N),' irregular benchmark data.'])
xlabel('\rightarrow frequency [Hz]')
ylabel('\rightarrow Logarithm of power spectral density')
axis tight

