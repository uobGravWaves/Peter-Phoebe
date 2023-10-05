

%Tell Matlab where to find the file, and what the file's name is
%You can either give it as a hardcoded location, or use "relative"
%locations

%pwd stands for Present Working Directory, it's the current folder you're
%running the code from
%"*.nc" finds everything with the file extension of ".nc"
dataLocation = fullfile(pwd, 'data', 'seasurfacesalinity', '*.nc');

%dir finds all the info about the files/folders given by dataLocation
%it creates a struct where the fields inside can be accessed using dot
%indexing
dataFolderInfo = dir(dataLocation);

%for example, we just want the name of the file, so we access the "name"
%field  using a .
dataNames = dataFolderInfo.name;

%now we have the name(s) of all the files we've just downloaded, this is a
%generic method, a much simpler way can be to just give it the name by copy
%and pasting, but that gets tedious with lots of files

%we can then get the exact location so that Matlab knows where to find them
exactFile = fullfile(dataFolderInfo.folder, dataNames);

%the files can now be loaded into the workspace
%most files with be a type called netCDF, but there may be outliers
salinity = get_ESA_data(exactFile);

%The data can be gotten using the same type of dot indexing from before
salinityData = salinity.Data;

%some ways of plotting need lats and lons as a grid
[lat, lon] = meshgrid(salinityData.lat, salinityData.lon);


%Now to do some plotting!

%This creates the figure
figure
%This tells the figure what type of map projection to use
m_proj('robinson')
%This plots the data, the "shading flat" is necessary if using a pcolor 
m_pcolor(lon, lat, salinityData.sss);shading flat
%These just make the map pretty!
m_grid('backgroundcolor', [0.5 0.5 0.5]);
clim([30 40])

colormap("jet")
title('15 Day Average Sea Surface Salinity: Jan 01, 2018')
colorbar
















