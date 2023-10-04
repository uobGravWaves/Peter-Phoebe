% SST

dataloc = 'C:\Users\pn399\Documents\GitHub\Peter-Phoebe\CT\data\SST\';
filename = 'D001-ESACCI-L4_GHRSST-SSTdepth-OSTIA-GLOB_CDR2.1-v02.0-fv01.0.nc';

%load data
SST = get_ESA_data(strcat(dataloc, filename));


% data
lon = SST.Data.lon;
lat = SST.Data.lat;
sea_surf = SST.Data.analysed_sst;

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
m_proj('miller','lat',[-30,60],'lon',[60,180]); 
m_pcolor(lon,lat,sea_surf'); shading flat;
colormap(cbrew('Blues',100))
m_coast('color','k');
colorbar();
m_grid();

% 
% xlim([60,180]);
% ylim([-30,30]);