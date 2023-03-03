import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:wheather_app/animations/bouncyanimation.dart';
import 'package:wheather_app/animations/homeanimation.dart';
import 'package:wheather_app/animations/newanimation.dart';
import 'package:wheather_app/home.dart';
import 'package:wheather_app/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

/////////////////////topcontainer/////////////////////////
class _LoginState extends State<Login> {
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
                  Color.fromARGB(255, 176, 115, 242),
                  Color(0xff3fa2fa),
                ])),
      ),
    );
  }
/////////////////////topcontainer///////////////////////

  //controller.................................
  final usercontroller = TextEditingController(text: " ");
  final passcontroller = TextEditingController(text: " ");
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/Raining-bro.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                            controller: usercontroller,
                            textInputAction: TextInputAction.done,
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
                              fillColor: Color.fromARGB(185, 255, 255, 255),
                              filled: true,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          obscureText: true,
                          controller: passcontroller,
                          textInputAction: TextInputAction.done,
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
                              fillColor: Color.fromARGB(185, 255, 255, 255),
                              filled: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedButton(
                          onPress: Login,
                          height: 40,
                          width: 150,
                          text: 'LOGIN',
                          isReverse: true,
                          selectedBackgroundColor:
                              Color.fromARGB(255, 167, 125, 216),
                          selectedTextColor: Colors.white,
                          transitionType: TransitionType.LEFT_TOP_ROUNDER,
                          backgroundColor: Color(0xff3fa2fa),
                          borderRadius: 50,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, createRoute());
                          },
                          child: Text(
                            'new user..! Register here',
                            style: TextStyle(
                              color: Color(0xff3fa2fa),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> Login() async {
    if (usercontroller.text.isEmpty || passcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    var res = await http.post(
        Uri.parse('http://192.168.29.228:3000/api/auth/login'),
        body: <String, String>{
          'username': usercontroller.text,
          'password': passcontroller.text
        });
    print(res.body);

    var mes = json.decode(res.body);
    if (res.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('login success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mes["error"])));
    }
  }
}
