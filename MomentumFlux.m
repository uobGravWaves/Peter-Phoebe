function [MFx, MFy] = MomentumFlux(A,k,l,m,BG,heights)

% Momentum flux function assuming that we are using the 137 levels from
% ECMWF to calculate pressure from the heights that we use

[ECMWF_Pressure, ECMWF_Altitude] = ecmwf_prs_v3(137);
I = griddedInterpolant(flip(ECMWF_Altitude), flip(ECMWF_Pressure));
Pressure = nan(1,1,length(heights));
Pressure(:,:,:) = I(heights);
Pressure = repmat(Pressure, size(A,1), size(A,2));

density = cjw_airdensity(Pressure,BG);
g = 9.81;
N = 0.02;

MFx = 1000*0.5*density.*(k./m).*((g./N).^2).*((A./BG).^2);
MFy = 1000*0.5*density.*(l./m).*((g./N).^2).*((A./BG).^2);
end
