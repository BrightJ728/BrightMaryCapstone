import MySQLdb

import mysql.connector
import requests

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="brightMary23?",
  database="Capstone_Database"
)
firestatus= "fire"
value=9
#import mysql.connector
mycursor = mydb.cursor()

