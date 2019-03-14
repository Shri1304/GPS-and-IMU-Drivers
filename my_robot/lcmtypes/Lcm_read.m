clear all;
close all;
clc;
javaaddpath lcm.jar
javaaddpath my_types.jar
javaaddpath GPS_readings.java
javaaddpath IMU_readings.java
%add jar files and log files to the matlab workspace
log_file = lcm.logging.Log('./lcm-log-2019-02-28-16_20_54', 'r'); 

for i= 1:100000
 try
     % there may be multiple channels but in this case you are only interested in Lab3 channel
     handle = log_file.readNext(); 
     if strcmp(handle.channel,'IMU')
                gps =exlcm.IMU_readings(handle.data);
                timestamp(i) = gps.timestamp;
                yaw(i)	    =gps.yaw;
                pitch(i)    =gps.pitch;
                roll(i)	    =gps.roll;
                magnetic_x(i)    =gps.magnetic_x;
                magnetic_y(i)    =gps.magnetic_y;
                magnetic_z(i)    =gps.magnetic_z;
                acceleration_x(i)  =gps.acceleration_x;
                acceleration_y(i)  =gps.acceleration_y;
                acceleration_z(i)  =gps.acceleration_z;
                angular_velocity_x(i) =gps.angular_velocity_x;
                angular_velocity_y(i) =gps.angular_velocity_y;
                angular_velocity_z(i) =gps.angular_velocity_z;      
     end
     
     if strcmp(handle.channel,'GPS')
                gps =exlcm.GPS_readings(handle.data);
                timestamp(i) = gps.timestamp;
                latitude(i)	 = gps.latitude;
                longitude(i) = gps.longitude;
                altitude(i)	 = gps.altitude;
                easting(i)   = gps.easting;
                northing(i)  = gps.northing;
     end
   catch err   % exception will be thrown when you hit end of file
   break;
 end
end
%%
easting(easting == 0) = [];
northing(northing==0) = [];
latitude(latitude==0) = [];
longitude(longitude==0) = [];
altitude(altitude==0) = [];


% acceleration_x(acceleration_x == 0) = [];
% acceleration_y(acceleration_y == 0) = [];
% acceleration_z(acceleration_z == 0) = [];
% magnetic_x(magnetic_x == 0) = [];
% magnetic_y(magnetic_y == 0) = [];
% magnetic_z(magnetic_z == 0) = [];


x=easting-min(easting);
y=northing-min(northing);
z=altitude;

accelReadings=[acceleration_x'  acceleration_y'  acceleration_z'];
gyroReadings=[angular_velocity_x' angular_velocity_y' angular_velocity_z'];
magReadings=[magnetic_x' magnetic_y' magnetic_z'];

% time_stamp = timestamp;
time_stamp = (timestamp - min(timestamp)) / 1e6;

IMU_Transpose=[timestamp' yaw' pitch' roll' magnetic_x' magnetic_y' magnetic_z' acceleration_x' acceleration_y' acceleration_z' angular_velocity_x' angular_velocity_y' angular_velocity_z'];
findindices1 = find(IMU_Transpose(:,1)==0);
IMU_Transpose(findindices1,:) = [];
timestamp=IMU_Transpose(:,1)';
yaw=IMU_Transpose(:,2)';
pitch=IMU_Transpose(:,3)';
roll=IMU_Transpose(:,4)';
magnetic_x=IMU_Transpose(:,5)';
magnetic_y=IMU_Transpose(:,6)';
magnetic_z=IMU_Transpose(:,7)';
acceleration_x=IMU_Transpose(:,8)';
acceleration_y=IMU_Transpose(:,9)';
acceleration_z=IMU_Transpose(:,10)';
angular_velocity_x=IMU_Transpose(:,11)';
angular_velocity_y=IMU_Transpose(:,12)';
angular_velocity_z=IMU_Transpose(:,13)';

%% Q4: Figures of all three sensors, of X,Y,Z axis' vs time

figure
subplot(3,1,1)
plot(magnetic_x);
ylabel('magnetic_x');
xlabel('time in i');
title('variation of magnetic_x');
subplot(3,1,2)
plot(magnetic_y)
ylabel('mag_y')
xlabel('time in i')
title('variation of magnetic_y')
subplot(3,1,3)
plot(magnetic_z)
ylabel('mag_z')
xlabel('time in i')
title('variation of magnetic_z')

figure
subplot(3,1,1)
plot(acceleration_x)
ylabel('accel_x')
xlabel('time in i')
title('variation of acceleration_x')
subplot(3,1,2)
plot(acceleration_y)
ylabel('acceleration_y')
xlabel('time in i')
title('variation of acceleration_y')
subplot(3,1,3)
plot(acceleration_z)
ylabel('acceleration_z')
xlabel('time in i')
title('variation of acceleration_z')

figure
subplot(3,1,1)
plot(angular_velocity_x)
ylabel('Angular-Velocity_x')
xlabel('time in i')
title('variation of Angular-Velocity_x')
subplot(3,1,2)
plot(angular_velocity_y)
ylabel('Angular-Velocity_y')
xlabel('time in i')
title('variation of Angular-Velocity_y')
subplot(3,1,3)
plot(angular_velocity_z)
ylabel('Angular-Velocity_z')
xlabel('time in i')
title('variation of Angular-Velocity_z')

%% Q5 Magnetometer soft iron and hard iron effects

figure();
hold();
magnetometer_correction = unwrap(-atan2d(magnetic_y,magnetic_x)*2*pi/360); %in radians
gyro_yaw = cumtrapz(timestamp, angular_velocity_z);
imu_yaw = unwrap(yaw)*2*pi/360; 
% subplot(3,1,1)
plot(timestamp, magnetometer_correction);
xlabel('Time');
ylabel('Magnetometer');
title('Corrected Magnetometer');     
subplot(2,1,1)
plot(timestamp,gyro_yaw);
xlabel('Time');
ylabel('Yaw Angle');
title('Gyro Yaw Angle');
subplot(2,1,2)
plot(timestamp, imu_yaw);
xlabel('Time');
ylabel('Yaw Angle');
title('IMU Yaw Angle');


%%
% x=fit_ellipse(magnetic_x,magnetic_y);
% rotmatrix=[cos(-x.phi) sin(-x.phi);-sin(-x.phi) cos(-x.phi)];
% h=[magnetic_x-x.X0_in; magnetic_y-x.Y0_in];
% calib_matrice=rotmatrix*h;
% 
% magnetic_x=calib_matrice(1,:);
% magnetic_y=calib_matrice(2,:);
% if x.a>x.b
%     magnetic_x=(x.b/x.a)*magnetic_x;
% elseif x.b>x.a
%     magnetic_y=(x.a/x.b)*magnetic_y;
% end  

%% Q6 estimate forward velocity

acceleration_x=acceleration_x';
acceleration_y=acceleration_y';
time_stamp=time_stamp';
velx=cumtrapz(time_stamp, acceleration_x);
vely=cumtrapz(time_stamp, acceleration_y);
vel=velx;
for i=2:size(easting,2)
   utm_vel(i-1)=sqrt((x(i)-x(i-1))^2+(y(i)-y(i-1))^2);
end
utm_vel=[0 utm_vel 0];
t=0:size(accelReadings,1)/size(easting,2):size(accelReadings,1);
s=time_stamp(end)/t(end);
figure()
hold();
subplot(2,1,1)
plot(time_stamp, vel);
subplot(2,1,2)
plot(t*s, utm_vel);
title('Velocity from IMU and GPS');
xlabel('time (s)');
ylabel('velocity(m/s)');
legend('IMU vel','GPS vel');

% Adjustment made estimed velocity
for i=1:size(accelReadings,1)
   accelx_adj(i)= acceleration_x(i)*cosd(pitch(i));
   accely_adj(i)= acceleration_y(i)*cosd(roll(i));
end
accelx_adj=accelx_adj-mean(accelx_adj);
accely_adj=accely_adj-mean(accely_adj);
%accely_adj=zeros(1,size(accelReadings,1));
time_stamp=time_stamp'; 

velx_adj= cumtrapz(time_stamp, accelx_adj);
vely_adj= cumtrapz(time_stamp, accely_adj);
vel_adj=velx_adj;
for i=1:size(accelReadings,1)
   if (vel_adj(i) < 0)
       vel_adj(i) =0;
   else
       vel_adj(i) = vel_adj(i);
   end
end

figure()
hold();
plot(time_stamp, vel_adj);
plot(t*s, utm_vel);
title('Adjustment Velocity from IMU and GPS');
xlabel('time (s)');
ylabel('velocity(m/s)');
legend('IMU adj_vel','GPS adj_vel');

%% Q7 Estimated trajecture with GPS track
xe_utm = easting-min(easting);
xn_utm = northing-min(northing);

theta=240;
R=[cosd(theta) sind(theta);
    -sind(theta) cosd(theta)];
gps_xy=1.1*R*[xe_utm' xn_utm']';
xe_utm = gps_xy(1,:);
xn_utm = gps_xy(2,:);
imu_x=xe_utm(1);
imu_y=xn_utm(1);
for i =2:size(vel_adj,2)
    imu_x(i) = imu_x(i-1)+cos(-yaw(i))*vel_adj(i-1)*dt;
    imu_y(i) = imu_y(i-1)+sin(-yaw(i))*vel_adj(i-1)*dt;
end

imu_xy=[imu_x;
        imu_y];

figure()
hold();
plot(imu_xy(1,:),imu_xy(2,:));
plot(xe_utm,xn_utm)
title('Estimated trajecture with GPS track')
legend('IMU','GPS');
xlabel('east(m)');
ylabel('north(m)');
axis equal;

%%
