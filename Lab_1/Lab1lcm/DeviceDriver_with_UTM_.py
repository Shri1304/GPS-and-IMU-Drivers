#!/usr/bin/env python
# -*- coding: utf-8 -*-
# for NBOSI-CT sensor (seabed 125)

import sys
import lcm
import time
import serial
import utm
from Lab1

port_name = "/dev/ttyUSB0"


class GPS(object):
    def __init__(self):
        self.port = serial.Serial("/dev/ttyUSB0", 4800, timeout=0.5)
        #self.lcm = lcm.LCM("udpm://?ttl=12")
        self.data = Lab1.Lab1()
        while True:
            try:
                line = self.port.readline()
                vals = line.split(",")
                print(int(vals[6]))
                if vals[0] == "$GPGGA" and int(vals[6]) > 0:

                    break
                elif int(vals[6])==0:
                    print("No GPS signal")
            except:
                print("initialization error")
        print('GPS: Initialization')


    def readwriteloop(self):
        n=0
        while True:
                rec=open("mygpsdata.txt","a")
                line = self.port.readline()
            #try:
                vals = line.split(',')
                #print(vals)
                if vals[0] == "$GPGGA" and int(vals[6]) > 0:
                    self.data.timestamp = float(vals[1])
                    if vals[3]=="N":  # North is positive and South is negative
                        self.data.latitude = float(vals[2])
                    elif vals[3]=="S":
                        self.data.latitude = float(-1.0 * vals[2])
                    if vals[5]=="W":  # West is positive and East is negative
                        self.data.longitude = float(vals[4])
                    elif vals[5]=="E":
                        self.data.longitude = float(vals[4])
                    self.data.altitude = float(vals[8])
		    (self.data.utm_x,self.data.utm_y,self.data.zone_number,self.data.zone_letter) = utm.from_latlon(self.data.latitude/100.0,-1.0*self.data.longitude/100.0)
                    #self.lcm.publish("GPS", self.data.encode())
                    s="{0},{1},{2},{3},{4},{5},{6},{7}\n".format(self.data.timestamp,self.data.latitude,self.data.longitude,self.data.altitude,self.data.utm_x,self.data.utm_y,self.data.zone_number,self.data.zone_letter)
                    rec.writelines(s)
                    n=n+1
                    print(n)
                    if n==1000:
                        break
                rec.close()
            #except:
            #    print 'GPS ERROR (' + line + ')'


GPS_test = GPS()
GPS_test.readwriteloop()
