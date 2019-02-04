file = fopen('mygpsdata3.txt');
c = textscan(file,'%f %f %f %f %f %f %f %s','delimiter', ',');
m = cell2mat(c(:,1:7));
latlon = [m(:,2) -m(:,3)];
latlon = (latlon-mod(latlon,100))/100.0+mod(latlon,100)/60.0; 

%get lat and lon

%convert lat lon to utm and plot it unit is meter
% axesm utm;
% Z=utmzone(latlon);
% setm(gca,'zone',Z)
% h = getm(gca)
% R=zeros(size(latlon));
% for i=1:length(latlon)
%     [x,y]= mfwdtran(h,latlon(i,1),latlon(i,2));
%     R(i,:)=[x;y];
% end

figure;
plot(m(:,5)/100000,m(:,6)/100000,'bs','linewidth',1) 
title('UTM-X vs UTM-Y [Moving]')
xlabel('Easting or UTM-X [meters]')
ylabel('Norting or UTM-Y [meters]')
mean(m(:,:))
std(m,0,1) %calculate Standard Deviation of utmx and utmy
var(m(:,6))
grid on