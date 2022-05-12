import smtplib, ssl
def sendEmail():
      port = 465  # For SSL
    smtp_server = "smtp.gmail.com"
    sender_email = "finalcapstone360@gmail.com"  # Enter your address
    receiver_email = "domfehadwoamary@gmail.com"  # Enter receiver address
    password = "marybright"
    message = """\
    Subject: FireSavers- FireAlert 

    This message is to notify of a fire alert. Kindly check the dashboard
    for Location  details."""
    context = ssl.create_default_context()
    with smtplib.SMTP_SSL(smtp_server, port, context=context) as server:
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, message)
       
if __name__=="__main__":
    sendEmail()
