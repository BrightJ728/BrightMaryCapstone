import time
import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl
import  RPi.GPIO as GPIO
#import board
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
#GPIO.setup(23, GPIO.OUT,initial =GPIO.LOW)
#GPIO.setup(5,GPIO.OUT,initial =GPIO.LOW)

#import RealSM
import Rtemp
import flameGas
#fuzzy Domian

temp = ctrl.Antecedent(np.arange(-40,80, 1), 'temp')
flame= ctrl.Antecedent(np.arange(-10, 40000, 1), 'flame')
gas = ctrl.Antecedent(np.arange(0, 40000, 1), 'gas')
output = ctrl.Consequent(np.arange(0, 100, 1), 'output')

#fuzzy input

#temperature
temp['cold'] = fuzz.trimf(temp.universe, [-40, 10,30])
temp['normal'] = fuzz.trimf(temp.universe, [10, 30, 40])
temp['hot'] = fuzz.trimf(temp.universe, [30,40, 80])

#flame
flame['near'] = fuzz.trimf(flame.universe, [0, 500,2000])
flame['not far'] = fuzz.trimf(flame.universe, [500,2000, 20000])
flame['far'] = fuzz.trimf(flame.universe, [15000, 20000, 40000])

# gas
gas['low'] = fuzz.trimf(gas.universe, [0, 500, 800])
gas['medium'] = fuzz.trimf(gas.universe, [800,900, 1000])
gas['high'] = fuzz.trimf(gas.universe, [1000, 10000, 40000])


#output
output['no fire'] = fuzz.trimf(output.universe, [0, 10, 25])
output['potential fire'] = fuzz.trimf(output.universe, [25, 40, 55])
output['fire'] = fuzz.trimf(output.universe, [55, 75, 100])

# def membershipFnx():
#     return [temp,flame,gas]
# Fuzzy Rules
#temp.view()

#flame.view()
#gas.view()

def fire_detection_Rules():
    Rule1a = ctrl.Rule(
        temp['cold'] & flame['far'] & gas['high'],
        output['potential fire']
    )
    Rule1b = ctrl.Rule(
        temp['cold'] & flame['not far'] & gas['high'], output['potential fire']
    )
    Rule1c = ctrl.Rule(
        temp['cold'] & flame['near'] & gas['high'],
        output['fire']
    )
    Rule1d = ctrl.Rule(
        temp['normal'] & flame['far'] & gas['high'],  output['potential fire']
    )

    Rule2a =ctrl.Rule(
        temp['normal'] & flame['not far'] & gas['high'], output['fire']
    )
    Rule2b = ctrl.Rule(
        temp['normal'] & flame['near'] & gas['high'],
        output['fire']
    )
    Rule2c = ctrl.Rule(
        temp['hot'] & flame['far'] & gas['high'],
        output['fire']
    )
    Rule2d = ctrl.Rule(
        temp['hot'] & flame['not far'] & gas['high'],
        output['fire']
    )
    Rule3a = ctrl.Rule(
        temp['hot'] & flame['near'] & gas['high'],
        output['fire']
    )
    Rule3b = ctrl.Rule(
        temp['cold'] & flame['far'] & gas['low'],
        output['no fire']
    )
    Rule3c = ctrl.Rule(
        temp['cold'] & flame['not far'] & gas['low'],
        output['no fire']
    )
    Rule3d = ctrl.Rule(
        temp['cold'] & flame['near'] & gas['low'],
        output['potential fire']
    )

    Rule4a = ctrl.Rule(
        temp['normal'] & flame['far'] & gas['low'],
        output['no fire']
    )
    Rule4b = ctrl.Rule(
        temp['normal'] & flame['not far'] & gas['low'],
        output['no fire']
    )
    Rule4c = ctrl.Rule(
        temp['normal'] & flame['near'] & gas['low'],
        output['potential fire']
    )
    Rule4d = ctrl.Rule(
        temp['hot'] & flame['far'] & gas['low'],
        output['potential fire']
    )

    Rule5a =ctrl.Rule(
        temp['hot'] & flame['not far'] & gas['low'],
        output['fire']
    )
    Rule5b =ctrl.Rule(
        temp['hot'] & flame['near'] & gas['low'],
        output['fire']
    )
    Rule5c =ctrl.Rule(
        temp['cold'] & flame['far'] & gas['medium'],
        output['no fire']
    )
    Rule5d =ctrl.Rule(
        temp['cold'] & flame['not far'] & gas['medium'],
        output['potential fire']
    )

    Rule6a =ctrl.Rule(
        temp['cold'] & flame['near'] & gas['medium'],
        output['fire']
    )
    Rule6b =ctrl.Rule(
        temp['normal'] & flame['far'] & gas['medium'],
        output['potential fire']
    )
    Rule6c =ctrl.Rule(
        temp['normal'] & flame['not far'] & gas['medium'],
        output['potential fire']
    )
    Rule6d=ctrl.Rule(
        temp['normal'] & flame['near'] & gas['medium'],
        output['fire']
    )

    Rule7a =ctrl.Rule(
        temp['hot'] & flame['far'] & gas['medium'],
        output['potential fire']
    )
    Rule7b =ctrl.Rule(
        temp['hot'] & flame['not far'] & gas['medium'],
        output['fire']
    )

    Rule7c =ctrl.Rule(
        temp['hot'] & flame['near'] & gas['medium'],
        output['fire']
    )




    return [
        Rule1a, Rule1b, Rule1c, Rule1d,
        Rule2a, Rule2a, Rule2b, Rule2d,
        Rule3a, Rule3b, Rule3c, Rule3d,
        Rule4a, Rule4b, Rule4c, Rule4d,
        Rule5a, Rule5b, Rule5c, Rule5d,
        Rule6a, Rule6b, Rule6c, Rule6d,
        Rule7a, Rule7b, Rule7c
    ]


#def deffuzzification():
## using the centroid defuzzication method
buzze = ctrl.ControlSystem( fire_detection_Rules())
buz_zer=ctrl.ControlSystemSimulation(buzze)
#import Rtemp
status=""
temp =""
gas=""
flame=""


import time
while True:
    try:
        start_time = time.time()
        temp=temperatureReading.temperature()
        gas=flameGas.GasSensor()
        flame=flameGas.FlameSensor()
        buz_zer.input['temp'] = temp
        buz_zer.input['flame'] =flame
        buz_zer.input['gas'] =gas
        print('temperature value is: '+ " ", temp)
        print('gas value is: '+ " ", gas)
        print('flame value is: '+ " ", flame)
        buz_zer.compute()
        print(round(buz_zer.output['output']))
        b =round(buz_zer.output['output'])
        if b <=40:
 #           GPIO.output(5,GPIO.HIGH)
            status='no fire'
            print(status)
            time.sleep(2.0)
        elif (b >=41) & (b<=50):
            #GPIO.output(5,GPIO.HIGH)
            status='potential fire'
            print(status)
            time.sleep(2.0)
        else:
            status= 'fire'
            print(status)
            import Rbuzzer
            # GPIO.output(23,GPIO.HIGH)
            #GPIO.output(6,GPIO.HIGH
            import SMScaps
            import RealSM
            import REmail
            RealSM.sendSms()
            import urllib.parse
            import urllib.request
            url = 'http://20.90.108.172/Capstone_WebApp/addsensor.php'


            values = { 'status':status}

            data = urllib.parse.urlencode(values)
            data = data.encode('ascii') # data should be bytes
            req = urllib.request.Request(url, data)
            print('submitted')
            print("--- %s seconds ---" % (time.time() - start_time))
            with urllib.request.urlopen(req) as response:
                the_page = response.read()

            time.sleep(2.0)

    except RuntimeError as error:
        # Errors happen fairly often, DHT's are hard to read, just >
        print(error.args[0])
        time.sleep(2.0)
        continue
    except Exception as error:
        dhtDevice.exit()
        raise error
        time.sleep(2.0)


  



