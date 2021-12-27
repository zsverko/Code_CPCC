function wPLI = wpli(hilbert_el_a,hilbert_el_b)
% Weighted phase-lag index 

% [1] Martin Vinck, Robert Oostenveld, Marijn Van Wingerden, Franscesco Battaglia,
% and Cyriel MA Pennartz. An improved index of phase-synchronization for electrophysiological
% data in the presence of volume-conduction, noise and samplesize
% bias. Neuroimage, 55(4):1548–1565, 2011.

% Inputs:
%   hilbert_el_a - hilbert transform of electrode a
%   hilbert_el_b - hilbert transform of electrode b
%
% Outputs:
%   wPLI - Weighted phase-lag index between electrode "a" and electrode "b"
%
% ---------------------------------------------------------------------- 
% Copyright (2020): Zoran Šverko; Peter Rogelj
%-----------------------------------------------------------------------

Sab=hilbert_el_a.*conj(hilbert_el_b);
ImSab=imag(Sab);
wPLI=abs(mean(abs(ImSab).*sign(ImSab))/mean(abs(ImSab)));
end

