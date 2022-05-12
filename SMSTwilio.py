from twilio.rest import Client

def Twiliosms():
    # Your Account SID from twilio.com/console
    account_sid = "AC90951957f5eb34584c634ada2bce6ebc"
    # Your Auth Token from twilio.com/console
    auth_token  = "f0b9d48bdd3e16eb0bc00b87696db2f6"

    client = Client(account_sid, auth_token)

    message = client.messages.create(
        to="+233248697356", 
        from_="+19704788792",
        body="SMS with Twilio - Fire alert!")

    print(message.sid)
if __name__=="__main__":
    Twiliosms()
