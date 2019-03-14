/* LCM type definition class file
 * This file was automatically generated by lcm-gen
 * DO NOT MODIFY BY HAND!!!!
 */

package exlcm;
 
import java.io.*;
import java.util.*;
import lcm.lcm.*;
 
public final class IMU_readings implements lcm.lcm.LCMEncodable
{
    public long timestamp;
    public double yaw;
    public double pitch;
    public double roll;
    public double magnetic_x;
    public double magnetic_y;
    public double magnetic_z;
    public double acceleration_x;
    public double acceleration_y;
    public double acceleration_z;
    public double angular_velocity_x;
    public double angular_velocity_y;
    public double angular_velocity_z;
 
    public IMU_readings()
    {
    }
 
    public static final long LCM_FINGERPRINT;
    public static final long LCM_FINGERPRINT_BASE = 0x9619673113e9dfbaL;
 
    static {
        LCM_FINGERPRINT = _hashRecursive(new ArrayList<Class<?>>());
    }
 
    public static long _hashRecursive(ArrayList<Class<?>> classes)
    {
        if (classes.contains(exlcm.IMU_readings.class))
            return 0L;
 
        classes.add(exlcm.IMU_readings.class);
        long hash = LCM_FINGERPRINT_BASE
            ;
        classes.remove(classes.size() - 1);
        return (hash<<1) + ((hash>>63)&1);
    }
 
    public void encode(DataOutput outs) throws IOException
    {
        outs.writeLong(LCM_FINGERPRINT);
        _encodeRecursive(outs);
    }
 
    public void _encodeRecursive(DataOutput outs) throws IOException
    {
        outs.writeLong(this.timestamp); 
 
        outs.writeDouble(this.yaw); 
 
        outs.writeDouble(this.pitch); 
 
        outs.writeDouble(this.roll); 
 
        outs.writeDouble(this.magnetic_x); 
 
        outs.writeDouble(this.magnetic_y); 
 
        outs.writeDouble(this.magnetic_z); 
 
        outs.writeDouble(this.acceleration_x); 
 
        outs.writeDouble(this.acceleration_y); 
 
        outs.writeDouble(this.acceleration_z); 
 
        outs.writeDouble(this.angular_velocity_x); 
 
        outs.writeDouble(this.angular_velocity_y); 
 
        outs.writeDouble(this.angular_velocity_z); 
 
    }
 
    public IMU_readings(byte[] data) throws IOException
    {
        this(new LCMDataInputStream(data));
    }
 
    public IMU_readings(DataInput ins) throws IOException
    {
        if (ins.readLong() != LCM_FINGERPRINT)
            throw new IOException("LCM Decode error: bad fingerprint");
 
        _decodeRecursive(ins);
    }
 
    public static exlcm.IMU_readings _decodeRecursiveFactory(DataInput ins) throws IOException
    {
        exlcm.IMU_readings o = new exlcm.IMU_readings();
        o._decodeRecursive(ins);
        return o;
    }
 
    public void _decodeRecursive(DataInput ins) throws IOException
    {
        this.timestamp = ins.readLong();
 
        this.yaw = ins.readDouble();
 
        this.pitch = ins.readDouble();
 
        this.roll = ins.readDouble();
 
        this.magnetic_x = ins.readDouble();
 
        this.magnetic_y = ins.readDouble();
 
        this.magnetic_z = ins.readDouble();
 
        this.acceleration_x = ins.readDouble();
 
        this.acceleration_y = ins.readDouble();
 
        this.acceleration_z = ins.readDouble();
 
        this.angular_velocity_x = ins.readDouble();
 
        this.angular_velocity_y = ins.readDouble();
 
        this.angular_velocity_z = ins.readDouble();
 
    }
 
    public exlcm.IMU_readings copy()
    {
        exlcm.IMU_readings outobj = new exlcm.IMU_readings();
        outobj.timestamp = this.timestamp;
 
        outobj.yaw = this.yaw;
 
        outobj.pitch = this.pitch;
 
        outobj.roll = this.roll;
 
        outobj.magnetic_x = this.magnetic_x;
 
        outobj.magnetic_y = this.magnetic_y;
 
        outobj.magnetic_z = this.magnetic_z;
 
        outobj.acceleration_x = this.acceleration_x;
 
        outobj.acceleration_y = this.acceleration_y;
 
        outobj.acceleration_z = this.acceleration_z;
 
        outobj.angular_velocity_x = this.angular_velocity_x;
 
        outobj.angular_velocity_y = this.angular_velocity_y;
 
        outobj.angular_velocity_z = this.angular_velocity_z;
 
        return outobj;
    }
 
}

