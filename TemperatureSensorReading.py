
import board
import adafruit_dht
import time


def temperature():
    
    
 # Initial the dht device, with data pin connected to:
# dhtDevice = adafruit_dht.DHT11(board.D21)
 
#    temperature_c =0
    #while True:
       
       
    dhtDevice = adafruit_dht.DHT22(board.D6, use_pulseio=False)
    #try:
    temperature_c = dhtDevice.temperature 
#    print(temperature_c)
    time.sleep(2.0)
                
    #except RuntimeError as error:

                    # Errors happen fairly often, DHT's are hard to read, just >
     #           print(error.args[0])
    #            time.sleep(2.0)
                #continue
   # except Exception as error:
  #              dhtDevice.exit()
 #               raise error
#                time.sleep(2.0)
    return temperature_c            
        

if __name__=="__main__":
	temperature()
    
