
%Read in folder with data
%Change seaice for whichever data you want
% cd('Peter-Phoebe/CT')

a = dir(fullfile(cd, 'data', 'ozone', '*.nc'));
n = numel(a);

%Set up the actually interesting variable
%432 x 432 for sea ice
%1440 x 720 for sea level (Very meh)
%7200 x 3600 for land temp (huge, only show one plot at a time if at all)
%18 x 23 for ozone
%Sea ice is best for animation, ozone is also cool though
bigVar = zeros(18, 23, n);

%Save interesting variable to array
for bean = 1:n
    dataset = rCDF(fullfile(a(1).folder, a(bean).name), 0);
    %Change RHS for the variable you want
    bigVar(:,:,bean) = dataset.merged_ozone_concentration;
end

%This is just bigshow
%They already have their map set up as blank space?? Wonderful
figure
for x = 1:size(bigVar, 3)

%         pcolor(bigVar(:,:,x));shading flat
        %For sea level & land temp(need the ' for it to be the correct orientation)
%         pcolor(bigVar(:,:,x)');shading flat
%         clim([0 320])
        %For ozone
        pcolor(ozone.approximate_altitude, ozone.latitude_centers, bigVar(:,:,x));shading flat
        colorbar
        drawnow
        pause(0.05)
end

%Just to make the land temp look nice
% m_proj('miller')
% m_pcolor(dataset.lon, dataset.lat, bigVar(:,:,2)')
% m_coast
% m_grid('backgroundcolor', [0.7 0.7 0.7]);


