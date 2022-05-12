# import the necessary packages
from picamera.array import PiRGBArray
from picamera import PiCamera
import urllib.parse
import urllib.request
import time
import cv2
import RealSM

# initialize the camera and grab a reference to the raw camera capture
start_time = time.time()
camera = PiCamera()
camera.resolution = (160,160)

rawCapture = PiRGBArray(camera)

#camera.annotate_text = "I am"
# allow the camera to warmup
time.sleep(0.1)
# grab an image from the camera
camera.capture(rawCapture,format ="bgr")
image = rawCapture.array
 

# display the image on screen and wait for a keypress
cv2.imshow("Image", image)
#cv2.imshow('Unchange', image)
cv2.waitKey(0)
#cv2.destroyAllWindows()	


from tflite_runtime.interpreter import Interpreter 
import numpy as np
#import tensorflow as tf

# Load the TFLite model and allocate tensors.
interpreter = Interpreter(model_path="model.tflite")
interpreter.allocate_tensors()

# Getoutput tensors.
output_details = interpreter.get_output_details() 


# Test the model on random input data. 
#input_data = np.array(image,dtype=np.float32)


def set_input_tensor(interpreter, image):

  tensor_index = interpreter.get_input_details()[0]['index']
 
#  print("Index of the input tensor: ", tensor_index, end="\n\n")

  # Return the input tensor based on its index.
  input_tensor = interpreter.tensor(tensor_index)()[0]
  # Assigning the image to the input tensor.
  input_tensor[:,:] = image

set_input_tensor(interpreter, image)

interpreter.invoke()

# The function `get_tensor()` returns a copy of the tensor data.
# Use `tensor()` in order to get a pointer to the tensor.
#output_data = interpreter.get_tensor(output_details[0]['index'])
#print(output_data[0][0])

output_data = np.squeeze(interpreter.get_tensor(output_details[0]['index']))
print(output_data)


if output_data<=9:
    print("no fire")
#elif ((output_data >=10) & (output_data<=14)):
#    print("potential fire")
else:
    print("fire")

time.sleep(2.0)
url = 'http://20.90.108.172/Capstone_WebApp/insertModule.php'
values = {'results' : output_data}
data = urllib.parse.urlencode(values)
data = data.encode('ascii') # data should be bytes
req = urllib.request.Request(url, data)
print('submitted')
#print("Time --- %s seconds ---" % (time.time() - start_time))
