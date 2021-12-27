function PLV = plv(hilbert_el_a,hilbert_el_b)
% Phase - locking value 

% [1] Jean-Philippe Lachaux, Eugenio Rodriguez, Jacques Martinerie, and Francisco J
% Varela. Measuring phase synchrony in brain signals. Human brain mapping,
% 8(4):194–208, 1999.

% Inputs:
%   hilbert_el_a - hilbert transform of electrode a
%   hilbert_el_b - hilbert transform of electrode b
%
% Outputs:
%   PLV - Phase locking value between electrode "a" and electrode "b"
%
% ---------------------------------------------------------------------- 
% Copyright (2020): Zoran Šverko; Peter Rogelj
%-----------------------------------------------------------------------
phase_angle_el_a=angle(hilbert_el_a);
phase_angle_el_b=angle(hilbert_el_b);

delta_pd=phase_angle_el_a-phase_angle_el_b;
PLV=abs(mean(exp(1i*(delta_pd))));

end

