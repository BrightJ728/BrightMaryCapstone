
import time
import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

i2c = busio.I2C(board.SCL, board.SDA)
def FlameSensor():
        # Create the I2C bus
 #   i2c = busio.I2C(board.SCL, board.SDA)

    # Create the ADC object using the I2C bus
    ads = ADS.ADS1015(i2c)
    ads.gain = 1
    
    # Create single-ended input on channel 0
    chan = AnalogIn(ads, ADS.P0)
    print('---flame here---')
    return chan.value 
    
if __name__=="__main__":
    FlameSensor()
    GasSensor()
