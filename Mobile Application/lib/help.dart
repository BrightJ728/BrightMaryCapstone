import 'package:flutter/material.dart';
import 'package:mobile_app/homePage.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_app/contact_us.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List<String> HelpItems = ["Destination", "website", "Map"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Help",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body: Center(
        child: Container(

/** double.infinity make it big as my parent allows
  MediaQuery make it big as per the screen
    **/
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
// even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 50, // image section height
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/help.png"))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Hello !!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "How can we help you today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 50,),
                  RaisedButton.icon(
                    onPressed: (){ },//_launchFireServiceWebApp();
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(' Website',
                      style: TextStyle(color: Colors.white),),
                    icon: Icon(Icons.chat, color:Colors.white,),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                   // splashColor: Colors.red,
                    color: Colors.red,),


                  SizedBox(height: 50,),
                  RaisedButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => ContactUs())));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text('Contact Us',
                      style: TextStyle(color: Colors.white),),
                    icon: Icon(Icons.phone, color:Colors.white,),
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    textColor: Colors.white,
                    color: Colors.orange,),
                ],
              ),
            ],
          ),
        ),

      ),
      );


}

}



/***
    launching fire service website
    forceWebView: true — this helps the app to start the
 web view of the app for the website to open inside the app itself.

forceSafariVC: true — in iOS devices, this helps the app to open the
website in the Safari View Controller other than the default browser

 ***/

// void  _launchFireServiceWebApp()  async{
//   const url = 'https://www.gnfs.gov.gh/';
//   if (await launch(url)) {
//     await launch(url, forceSafariVC: true, forceWebView: true);
//   }  {
//     throw 'Could not launch $url';
//   }
// }


