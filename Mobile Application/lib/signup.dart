import 'package:flutter/material.dart';
import 'package:mobile_app/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mysql1/mysql1.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // global key
  // Formstate object can be used to [save], [reset], and [validate] every form field

  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _namecontrol = new TextEditingController();
  final TextEditingController _emailcontrol = new TextEditingController();
  final TextEditingController _areacontrol = new TextEditingController();
  final TextEditingController _Regioncontrol = new TextEditingController();
  final TextEditingController _phonenumbercontrol = new TextEditingController();
  final TextEditingController _passwordcontrol = new TextEditingController();
  final TextEditingController _changepasswordcontrol = new TextEditingController();


  // register
  Future register() async {
    var url = "http://20.90.108.172/Mobile/insert.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": _namecontrol.text,
      "email": _emailcontrol.text,
      "location": _areacontrol.text,
      "region": _Regioncontrol.text,
      "phone": _phonenumbercontrol.text,
      "password": _passwordcontrol.text
    });

    if ( response.statusCode == 200){
      print("Inserted to Db is successful ");
    }

    else{
    print("Insertion to Db is not  successful ");
    }
  }

/////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Register'),
            backgroundColor: Colors.redAccent
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
              // center of content - whole body
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                    child: Form(
                        key: _globalkey,
                        child: Column(children: <Widget>[
                          Container(
                              child:Column(
                                  children:[
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color:Colors.red[400],
                                          //height: 1
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Create your account",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:Colors.grey[500]

                                      ),
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: 10,), // space between containers

                          // name  text form field
                          TextFormField(
                            controller: _namecontrol,
                            keyboardType: TextInputType.name,
                            autofocus: false,
                            /*onSaved: (value) {
                              _namecontrol.text = value!;
                            }*/
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Full Name",
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),

                            ) ,
                          ),
                          SizedBox(height: 8,),



                          // phone number   text form field
                          TextFormField(
                            controller: _phonenumbercontrol,
                            keyboardType: TextInputType.phone,
                            autofocus: false,
                            /*onSaved: (value) {
                              _phonenumbercontrol.text = value!;
                            },*/
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: "Phone Number",
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),

                            ) ,
                          ),

                          SizedBox(height: 8,),

                          // email  text form field
                          TextFormField(
                            controller: _emailcontrol,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            // onSaved: (value) {
                            //   _emailcontrol.text = value!;
                            // },
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

                          SizedBox(height: 8,),

                          // area / community  where device is installed  text form field
                          TextFormField(
                            controller: _areacontrol,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            // onSaved: (value) {
                            //   _areacontrol.text = value!;
                            // },
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.home),
                              hintText: "area/ Community where you live",
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),

                            ) ,
                          ),

                          SizedBox(height: 8,),
                          // Region  where device is installed  text form field
                          TextFormField(
                            controller: _Regioncontrol,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            // onSaved: (value) {
                            //   _Regioncontrol.text = value!;
                            // },
                            textInputAction: TextInputAction.next,
                            decoration:InputDecoration(
                              prefixIcon: Icon(Icons.home),
                              hintText: "Region where you reside",
                              contentPadding: EdgeInsets.all(12.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),

                            ) ,
                          ),


                          // password text form field
                          SizedBox(height: 8,),
                          TextFormField(
                              autofocus: false,
                              controller: _passwordcontrol,
                              // onSaved: (value) {
                              //   _passwordcontrol.text = value!;
                              // },
                              textInputAction: TextInputAction.next,
                              decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.all(12.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )
                              )
                          ),

                          SizedBox(height: 8,),


                          // password text form field
                          TextFormField(
                              autofocus: false,
                              controller: _changepasswordcontrol,
                              // onSaved: (value) {
                              //   _changepasswordcontrol.text = value!;
                              // },
                              textInputAction: TextInputAction.done,
                              decoration:InputDecoration(
                                  prefixIcon: Icon(Icons.vpn_key),
                                  hintText: "Confirm Password",
                                  contentPadding: EdgeInsets.all(12.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  )
                              )
                          ),
                          SizedBox(height: 20,),
                          
                          // signup button
                          MaterialButton(
                            minWidth: double.infinity,
                            //minWidth: MediaQuery.of(context).size.width/2,
                            height: 60,
                            color: Colors.red[400],
                            onPressed: () {
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                              register();

                            },
                            // defining the shape
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white
                              ),

                            ),
                          ),

                          //SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget> [
                              Text("Have an Account Already?"),
                              MaterialButton(
                                //padding: EdgeInsets.all(20.0),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

                                  },

                                  child:  const Text(
                                    "Login" ,
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
