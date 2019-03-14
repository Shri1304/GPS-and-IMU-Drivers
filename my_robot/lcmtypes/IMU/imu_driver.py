import sys
import lcm
import time
import serial
import imu_t
import numpy as np

port_name = "/dev/ttyUSB0"


class IMU(object):
    def __init__(self):
        self.port = serial.Serial("/dev/ttyUSB0", 115200, timeout=0.5)
        #self.lcm = lcm.LCM("udpm://?ttl=12")
        self.data = imu_t.imu_t()
        while True:
            try:
                line = self.port.readline()
                vals = line.split(",")
                if vals[0] == "$VNYMR":
                    break
                elif int(vals[1] | vals[2] | vals [3])==0:
                    print("No IMU data")
            except:
                print("initialization error")
        print('IMU: Initialization')


    def readwriteloop(self):
        n=0
        while True:
                rec=open("myIMUdata.txt","a")
                line = self.port.readline()
            #try:
                vals = np.array(line.split(','))
                #print(vals)
                if vals[0] == "$VNYMR":
                    self.data.yaw = float(vals[1])
                    self.data.pitch = float(vals[2])
                    self.data.roll = float(vals[3])
                    self.data.mag_x = float(vals[4])
                    self.data.mag_y = float(vals[5])
                    self.data.mag_z = float(vals[6])
                    self.data.acc_x = float(vals[7])
                    self.data.acc_y = float(vals[8])
                    self.data.acc_z = float(vals[9])
                    self.data.gyro_x_radps = float(vals[10])
                    self.data.gyro_y_radps = float(vals[11])
		    imu_last = vals[12]
		    imu_remove = np.array(imu_last.split('*'))	
                    self.data.gyro_z_radps = float(imu_remove[0])
                    
                    s="{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11}\n".format(self.data.yaw,self.data.pitch,self.data.roll,self.data.mag_x,self.data.mag_y,self.data.mag_z,self.data.acc_x,self.data.acc_y, self.data.acc_z,self.data.gyro_x_radps,self.data.gyro_y_radps,self.data.gyro_z_radps)
                    rec.writelines(s)
                    n=n+1
                    print(n)
                    if n==1000:
                        break
                rec.close()

IMU_test = IMU()
IMU_test.readwriteloop()
