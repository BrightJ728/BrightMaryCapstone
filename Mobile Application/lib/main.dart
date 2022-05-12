import 'package:mobile_app/login.dart';
import 'package:mobile_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'viewAllUsers.dart';
import 'homePage.dart';
import 'notifications_view.dart';

// view all users
List userData = [];

// get device details
List sensorDetails = [];

// notification
List NotifyDetails = [];


void main() async{
    runApp(const MaterialApp(
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    ));
userData = await getUsers();

sensorDetails = await getSensorDetails();

NotifyDetails = await getNotifyDetails();


  }

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Container(
          // double.infinity make it big as my parent allows
          //  MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome to FireSavers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("We save your home from fire outbreak",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,

                    ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/4,
                //height: 200,
                decoration: const BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage("assets/fire.jpg")

                    )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupPage()));

                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    ),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );



  }

  }

