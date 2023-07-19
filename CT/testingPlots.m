
%Read in folder with data
%Change seaice for whichever data you want
% cd('Peter-Phoebe/CT')

a = dir(fullfile(cd, 'data', 'sealevel', '*.nc'));
n = numel(a);

%Set up the actually interesting variable
%432 x 432 for sea ice
%1440 x 720 for sea level
bigVar = zeros(1440, 720, n);

%Save interesting variable to array
for bean = 1:n
    dataset = rCDF(fullfile(a(1).folder, a(bean).name), 0);
    %Change RHS for the variable you want
    bigVar(:,:,bean) = dataset.sla;
end

%This is just bigshow
%They already have their map set up as blank space?? Wonderful
figure
for x = 1:size(bigVar, 3)

%         pcolor(bigVar(:,:,x));shading flat
        %For sea level (need the ' for it to be the correct orientation)
        pcolor(bigVar(:,:,x)');shading flat
        %For ozone
%         pcolor(ozone.approximate_altitude, ozone.latitude_centers, bigVar(:,:,x));shading flat
        colorbar
        drawnow
        pause(0.1)
end



