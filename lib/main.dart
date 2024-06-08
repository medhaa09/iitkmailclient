
import 'package:flutter/material.dart';
import 'package:mailclient/login/login.dart';
Future<void> main() async {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mail Client',
      theme: ThemeData(
         //primarySwatch: Colors.black87,
      ),
      home:const LoginPage()
    );
  }
}
