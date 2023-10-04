% Pretty fire plot
year = 2018;

for i = 7:7
    mnth = sprintf('%02d',i);

    dataloc = 'C:\Users\pn399\Documents\GitHub\Peter-Phoebe\CT\data\Fire\';
    filename = strcat(string(year),mnth,'01-ESACCI-L4_FIRE-BA-AVHRR-LTDR-fv1.1.nc');
    
    %load data
    Fires = get_ESA_data(strcat(dataloc, filename));
    
    % data
    lon = Fires.Data.lon;
    lat = Fires.Data.lat;
    burned_area = Fires.Data.burned_area;
    
    % 
    % [lats,lons] = meshgrid(-50:0.2:0,100:0.2:180);
    % land = landmask(lats,lons);

    % 
    % % figure
    % %fires = land.*burned_area;
    % fires = burned_area;
    % fires(land == 0) = NaN;

    figure()
    hold on
    m_proj('lambert','lon',[100 180],'lat',[-50 0]); 
    m_pcolor(lon,lat,burned_area'); shading flat;
    colormap(cbrew('YlOrRd',100))
    m_coast('color','k');
    colorbar();
    m_grid();
    clim([0,100000000])


    % m_pcolor(lon,lat,land'); shading flat;

    

end