import 'package:flutter/material.dart';
import 'package:mobile_app/signup.dart';
import 'package:mobile_app/homePage.dart';
import 'package:mobile_app/changePassword.dart';
import 'package:mobile_app/Forgot_PasswordLoginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // global key
  // Formstate object can be used to [save], [reset], and [validate] every form field

  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _emailcontrol = new TextEditingController();
  final TextEditingController _passwordcontrol = new TextEditingController();


  Future login() async {
    var url = "http://20.90.108.172/Mobile/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": _emailcontrol.text,
      "password": _passwordcontrol.text
    });


    var data = json.decode(response.body);
    if( data=="Error"){
      showDialog(
        context: context,
        builder: (BuildContext context) => _builLogin(context),
      );

    }

    else{
      // Store value to session

      await FlutterSession().set("data", data);
    // Retrieve item from session
    dynamic token = await FlutterSession().get("data");

   // print(token);

      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) => _builLogin(context),
      // );


      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));

    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text('Login'),
            backgroundColor: Colors.redAccent
        ),

        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
              // center of content - whole body
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Container(
                    child: Form(
                        key: _globalkey,
                        child: Column(children: <Widget>[
                          Container(
                              child:Column(
                                  children:[
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.red[400]
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Sign into your account",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:Colors.grey[500]

                                      ),
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: 30,), // space between containers

                          // email  text form field
                          TextFormField(
                            controller: _emailcontrol,
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              hintText: "Email",
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                              ),

                            ) ,
                          ),

                          // password text form field
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: _passwordcontrol,
                            textInputAction: TextInputAction.done,
                              decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.all(12.0),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                  )
                          )
                          ),

                          SizedBox(height: 5,),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                          MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => changePasswordLogin(),
                                );

                              },
                              child:  const Text(
                                "Forget Password" ,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.redAccent
                                ),
                              )

                          ),
                        ],

                ),


                          SizedBox(height: 50,),
                          // login button
                          MaterialButton(
                            minWidth: double.infinity,

                            //minWidth: MediaQuery.of(context).size.width/2,
                            height: 60,
                              color: Colors.red[400],
                            padding: EdgeInsets.all(12.0),
                            onPressed: () {

                              login();
                              //getUsers();


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
                                  fontSize: 18,
                                  color: Colors.white


                              ),
                            ),
                          ),

                        SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget> [
                              Text("Don't Have an Account?"),
                              MaterialButton(
                                //padding: EdgeInsets.all(20.0),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));

                               },

                                child:  const Text(
                                  "Sign Up" ,
                                   style: TextStyle(
                                      fontWeight: FontWeight.w600 ,
                                      fontSize: 18,
                                      color: Colors.red
                                   ),
                                  )

                                  )


                            ],


                          )



                        ]
                          )
            )
        )
    )
    )
    );
  }
}


Widget _builLogin(BuildContext context) {
  return new AlertDialog(
    title: const Text('Confirmation'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Login Failed"),
      ],
    ),
    actions: <Widget>[
      new RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme
            .of(context)
            .primaryColor,
        child: Text('Exit')
      ),


    ],
  );
}

