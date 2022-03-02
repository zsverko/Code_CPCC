function [imCPCC] = fun_imCPCC(sig1_complx,sig2_complx)

% Imaginary component of complex Pearson correlation coefficient

% [1] Šverko, Z.; Vrankić, M.; Vlahinić, S.; Rogelj, P. Complex Pearson 
% Correlation Coefficient for EEG Connectivity Analysis. Sensors 2022, 
% 22, 1477. https://doi.org/10.3390/s22041477 

%   INPUT PARAMETERS
%   sig1_complx - signal after hilbert transform, dimension (1xSAMPLES)
%   sig2_complx - signal after hilbert transform, dimension (1xSAMPLES)

%   OUTPUT PARAMETERS
%   imCPCC - imaginary component of complex Pearson correlation coefficient

% ---------------------------------------------------------------------- 
% Copyright (2022): Zoran Šverko
%-----------------------------------------------------------------------

imCPCC=abs(imag(dot((sig1_complx),(sig2_complx))/(norm(sig1_complx)*norm(sig2_complx))));

end

