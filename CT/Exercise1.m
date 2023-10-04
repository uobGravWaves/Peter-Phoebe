% Example 1
clear all

% ***** THIS SECTION IS WHAT YOU NEED TO EDIT FIRST! **********************************
% change the data location and file name to match your data
data_location = 'C:\Users\pn399\OneDrive - University of Bath\Teaching\CT\Exercise1\'; 
file_name = 'ESACCI-SEAICE-L4-SICONC-AMSR_25.0kmEASE2-NH-20160801-fv2.1.nc';           
% *************************************************************************************


% this line joins together the data location and filename to make a path
% for the data
data_path = strcat(data_location,file_name);

% This line uses the function nph_getnet to read in the netcdf (.nc) files
% into matlab
sea_ice = nph_getnet(data_path);

% Here we extract the data we want from the structure called sea_ice
ice_concentration = sea_ice.Data.ice_conc;

% Plotting
figure()
pcolor(ice_concentration); shading flat; % the shading flat here is important
title('Put title here')
c = colorbar();
c.Label.String = 'put colorbar label here';