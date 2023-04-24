import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wheather_app/animations/homeanimation.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/screens/login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _LoginState();
}

//////////////////////topcontainer/////////////////////////
class _LoginState extends State<Register> {
  Widget topwidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
                begin: Alignment(-0.2, -0.8),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff955cd1),
                  Color(0xff3fa2fa),
                ])),
      ),
    );
  }

  ///////////////////////topcontainer////////////// ///////
  //controller.................................

  final usercontroller = TextEditingController(text: "");
  final passcontroller = TextEditingController(text: "");
  final confirmconroller = TextEditingController(text: "");
  //controller..................................

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -160, left: -30, child: topwidget(screensize.width)),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white38),
                  child: Container(
                    //alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            'REGISTER HERE !',
                            style: GoogleFonts.cinzel(
                                textStyle: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   child: Image.asset(
                            //     'Raining-bro.png',
                            //     height: 200,
                            //     width: 200,
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                  controller: usercontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff955cd1)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    fillColor:
                                        Color.fromARGB(185, 255, 255, 255),
                                    filled: true,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: passcontroller,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    suffixIcon: Icon(
                                      Icons.visibility,
                                      size: 25,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff3fa2fa)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    fillColor:
                                        Color.fromARGB(185, 255, 255, 255),
                                    filled: true),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                  controller: confirmconroller,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    suffixIcon: Icon(
                                      Icons.visibility,
                                      size: 25,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff955cd1)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    fillColor:
                                        Color.fromARGB(185, 255, 255, 255),
                                    filled: true,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: AnimatedButton(
                                onPress: Register,
                                height: 40,
                                width: 150,
                                text: 'REGISTER',
                                isReverse: true,
                                selectedBackgroundColor:
                                    Color.fromARGB(255, 167, 125, 216),
                                selectedTextColor: Colors.white,
                                transitionType: TransitionType.LEFT_TOP_ROUNDER,
                                backgroundColor: Color(0xff3fa2fa),
                                borderRadius: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> Register() async {
    if (usercontroller.text.isEmpty ||
        passcontroller.text.isEmpty ||
        confirmconroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passcontroller.text != confirmconroller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    var response = await http.post(
        Uri.parse('http://192.168.29.152:5000/api/auth/register'),
        body: <String, String>{
          'username': usercontroller.text,
          'password': passcontroller.text
        });
    print(response.body);

    var body = json.decode(response.body);
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body["message"])));
    }
  }
}
