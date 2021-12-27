function PLI = pli(hilbert_el_a,hilbert_el_b)
% Phase - lag index 

% [1] Stam, C. J., Nolte, G., & Daffertshofer, A. (2007). Phase lag index: 
% assessment of functional connectivity from multi channel EEG and MEG with 
% diminished bias from common sources. Human brain mapping, 28(11), 1178-1193.

% Inputs:
%   hilbert_el_a - hilbert transform of electrode a
%   hilbert_el_b - hilbert transform of electrode b
%
% Outputs:
%   PLI - Phase - lag index between electrode "a" and electrode "b"
%
% ---------------------------------------------------------------------- 
% Copyright (2020): Zoran Šverko; Peter Rogelj
%-----------------------------------------------------------------------

Sab=hilbert_el_a.*conj(hilbert_el_b);
PLI=abs(mean(sign(imag(Sab))));
end

