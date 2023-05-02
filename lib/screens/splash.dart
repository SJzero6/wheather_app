import 'package:flutter/material.dart';

import 'package:wheather_app/screens/home.dart';
import 'package:wheather_app/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navigatetohome();
    super.initState();
  }

  _navigatetohome() {
    Future.delayed(const Duration(milliseconds: 9000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => Login())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 245, 245),
      body: Center(
        child: Image.network(
            'https://icon-library.com/images/weather-icon-gif/weather-icon-gif-21.jpg'),
      ),
    );
  }
}
