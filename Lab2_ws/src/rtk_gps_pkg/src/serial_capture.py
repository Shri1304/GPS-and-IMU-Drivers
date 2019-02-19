#! /usr/bin/env python

import serial

import rospy

import rtk_gps_pkg.driver(without UTM)
import rtk_gps_pkg.parser(without UTM)
import sys

if __name__ == '__main__':
    rospy.init_node('serial_capture')

    serial_port = rospy.get_param('~port','/dev/ttyACM0')
    serial_baud = rospy.get_param('~baud',115200)
    frame_id = rtk_gps_pkg.driver(without UTM).GPSRTK.get_frame_id()

    try:
        GPS = serial.Serial(port=serial_port, baudrate=serial_baud, timeout=0.5)

        try:
            driver = rtk_gps_pkg.driver(without UTM).GPSRTK()
            while not rospy.is_shutdown():
                data = GPS.readline().strip()
                try:
                    driver.add_sentence(data, frame_id)
                except ValueError as e:
                    rospy.logwarn("Value error, likely due to missing fields in the NMEA message." % e)

        except (rospy.ROSInterruptException, serial.serialutil.SerialException):
            GPS.close() #Close GPS serial port
    except serial.SerialException as ex:
        rospy.logfatal("Could not open serial port: I/O error({0}): {1}".format(ex.errno, ex.strerror))
