import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/constants/constants.dart';
import 'package:wheather_app/provider/weatherpro.dart';
import 'package:wheather_app/screens/home.dart';
import 'package:wheather_app/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:wheather_app/screens/splash.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Mqttprovider())],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundcolor,
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: kprimarycolor)),
        home: Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
