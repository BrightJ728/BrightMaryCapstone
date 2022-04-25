
import time
import board
import busio
import adafruit_ads1x15.ads1015 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

i2c = busio.I2C(board.SCL, board.SDA)
def GasSensor():
        # Create the I2C bus
 #   i2c = busio.I2C(board.SCL, board.SDA)

    # Create the ADC object using the I2C bus
    ads = ADS.ADS1015(i2c)
    ads.gain = 1
    
    # Create single-ended input on channel 0
    chan = AnalogIn(ads, ADS.P1)
    print('---Gas here---')
    return chan.value 
    
if __name__=="__main__":
    GasSensor()
