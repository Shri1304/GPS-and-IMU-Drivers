import math

import rospy

from sensor_msgs.msg import NavSatFix
from nav_msgs import Odomentry

class GPSRTK(object):

    def __init__(self):
        # Our publishers
        self.fix_pub = rospy.Publisher('Serialfix', NavSatFix, queue_size=1)
        self.timeref_pub = rospy.Publisher('time', TimeReference, queue_size=1)
        # Frame of references we should publish in
        self.frame_timeref = rospy.get_param('~frame_timeref', 'gps')
        self.frame_gps = rospy.get_param('~frame_gps', 'gps')
        self.use_rostime = rospy.get_param('~use_rostime', True)
        self.use_rmc = rospy.get_param('~use_rmc', False)
        # Flags for what information we have
        self.has_fix = False
        self.has_std = False
        self.has_timeref = False
        # Blank messages we create
        self.msg_fix = NavSatFix()
        self.msg_timeref = TimeReference()


    # Will process the nmea_string, and try to update our current state
    # Should try to publish as many messages as possible with the given data
    def process_line(self, nmea_string):
        
        # Check if valid message
        if not check_nmea_checksum(nmea_string):
            rospy.logwarn("Received a sentence with an invalid checksum. Sentence was: %s" % repr(nmea_string))
            return
        
        # Else we are good, lets try to process this message
        parsed_sentence = reach_ros_node.parser.parse_nmea_sentence(nmea_string)
        if not parsed_sentence:
            rospy.logwarn("Failed to parse NMEA sentence. Sentence was: %s" % nmea_string)
            return

        # We have a good message!!
        # Lets send it to the correct method to get processed
        self.parse_GGA(parsed_sentence)

        # Special care to parse the time reference
        # This can come from either the GGA or RMC
        self.parse_time(parsed_sentence)

        # Now that we are done with processing messages
        # Lets publish what we have!
        if self.has_fix and self.has_std:
            self.fix_pub.publish(self.msg_fix)
            self.msg_fix = NavSatFix()
            self.has_fix = False
            self.has_std = False
        if self.has_timeref:
            self.timeref_pub.publish(self.msg_timeref)
            self.msg_timeref = TimeReference()
            self.has_timeref = False

    # Parses the GGA NMEA message type
    def parse_GGA(self,datag):
        # Check if we should parse this message
        if not 'GGA' in datag:
            return
        # Return if are using RCm
        if self.use_rmc:
            return
        # Else lets set what variables we can
        data = datag['GGA']
        # If using ROS time, use the current timestamp
        if self.use_rostime:
            self.msg_fix.header.stamp = rospy.get_rostime()
        else:
            self.msg_fix.header.stamp = rospy.Time.from_sec(data['utc_time'])
        # Set the frame ID
        self.msg_fix.header.frame_id = self.frame_gps
        # Set what our fix status should be
        gps_qual = data['fix_type']
        if gps_qual == 0:
            self.msg_fix.status.status = NavSatStatus.STATUS_NO_FIX
        elif gps_qual == 1:
            self.msg_fix.status.status = NavSatStatus.STATUS_FIX
        elif gps_qual == 2:
            self.msg_fix.status.status = NavSatStatus.STATUS_SBAS_FIX
        elif gps_qual in (4, 5):
            self.msg_fix.status.status = NavSatStatus.STATUS_GBAS_FIX
        else:
            self.msg_fix.status.status = NavSatStatus.STATUS_NO_FIX
        self.msg_fix.status.service = NavSatStatus.SERVICE_GPS
        # Set our lat lon position

            latitude = data['latitude']
            if data['latitude_direction'] == 'N':
            current_fix.latitude = latitude

            latitude = data['latitude']
            if data['latitude_direction'] == 'S':
                latitude = -latitude
            current_fix.latitude = latitude

            longitude = data['longitude']
            if data['longitude_direction'] == 'E':
            current_fix.longitude = longitude

            longitude = data['longitude']
            if data['longitude_direction'] == 'W':
                longitude = -longitude
            current_fix.longitude = longitude

        # Altitude is above ellipsoid, so adjust for mean-sea-level
        self.msg_fix.altitude = data['altitude'] + data['mean_sea_level']
        self.has_fix = True
	(current_fix.utm_x,current_fix.utm_y,current_fix.zone_number,current_fix.zone_letter) = utm.from_latlon(current_fix.latitude/100.0,-1.0*current_fix.longitude/100.0)

    # Parses the NMEA messages and just grab the time reference
    def parse_time(self,datag):

        # Get our message data
        if not self.use_rmc and 'GGA' in datag:
            data = datag['GGA']
        elif self.use_rmc and 'RMC' in datag:
            data = datag['RMC']
        else:
            return
        # Return if time is NaN
        if math.isnan(data['utc_time']):
            return
        # If using ROS time, use the current timestamp
        if self.use_rostime:
            self.msg_timeref.header.stamp = rospy.get_rostime()
        else:
            self.msg_timeref.header.stamp = rospy.Time.from_sec(data['utc_time'])
        # Set the frame ID
        self.msg_timeref.header.frame_id = self.frame_timeref
        # Set the actuall time reference
        self.msg_timeref.time_ref = rospy.Time.from_sec(data['utc_time'])
        self.msg_timeref.source = self.frame_timeref
        self.has_timeref = True
        

