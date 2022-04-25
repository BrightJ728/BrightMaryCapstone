import serial
import RPi.GPIO as GPIO     
import os, time
#GPIO.setmode(GPIO.BOARD)
#import smtplib, ssl

def sendSms():
    #GPIO.setmode(GPIO.BOARD)
    # Enable Serial Communication
    port = serial.Serial("/dev/ttyS0", baudrate=9600, timeout=1)
    
    # Transmitting AT Commands to the Modem
    # '\r\n' indicates the Enter key
    
    port.write(('AT').encode())
    rcv = port.read(10)
    print( rcv)
    time.sleep(1)
    
    port.write(('ATE0'+'\r\n').encode())      # Disable the Echo
    rcv = port.read(10)
    print( rcv)
    time.sleep(1)
    
    port.write(('AT+CMGF=1'+'\r\n').encode())  # Select Message format as Text mode
    rcv = port.read(10)
    print( rcv)
    time.sleep(1)
    
    port.write(('AT+CNMI=2,1,0,0,0'+'\r\n').encode())   # New SMS Message Indications
    rcv = port.read(10)
    print( rcv)
    time.sleep(1)
    
    
    # Sending a message to a particular Number
    
    port.write(('AT+CMGS="+233248697356"'+'\r\n').encode())
    rcv = port.read(10)
    print ("Message sent to customer")
    print( rcv)
    time.sleep(1)
    
    port.write((b'Fire detected'+ b'\r\n'))  # Message
    rcv = port.read(10)
    
    print( rcv)
    
    port.write(("\x1A").encode()) # Enable to send SMS
    for i in range(10):
        rcv = port.read(10)
        print( rcv)
    



#port = 465  # For SSL
#smtp_server = "smtp.gmail.com"
#sender_email = "finalcapstone360@gmail.com"  # Enter your address
#receiver_email = "domfehadwoamary@gmail.com"  # Enter receiver address
#password = "marybright"
#message =\Subject: FireSavers- FireAlert 

#This message is to notify of a fire alert. Kindly check the dashboard
#for Location  details."""

#context = ssl.create_default_context()
#with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
 #   server.login(sender_email, password)
  #  server.sendmail(sender_email, receiver_email, message)

    



if __name__=="__main__":
    sendSms()
