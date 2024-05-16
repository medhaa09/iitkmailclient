//import 'package:animate_do/animate_do.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
void main() => runApp(
   MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
);
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        width:double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
          colors: [Color(0xff000000), Color(0xff142b42)],
          stops: [0.1, 1],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        )
        ),
        
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
        children:<Widget>[
          SizedBox(height:80,),
          Padding(
            padding: EdgeInsets.all(20),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:<Widget>[
           Text("Login", style:TextStyle(color:Colors.white,fontSize:40)),
           SizedBox(height:10,),
          
            ]
           ),
           ),
           SizedBox(height:20),
          Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
              color:Colors.white,
            ),
         child:Padding(
          padding:EdgeInsets.all(20),
          child:Column(
            children:<Widget>[
              Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
              ),
            ),
           ),
            Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextFormField(
          obscureText: true, // This hides the entered text
          decoration: const InputDecoration(
            border: OutlineInputBorder(), // Use OutlineInputBorder for boxed border
            labelText: 'Password',
          ),
        ),
            ),
            ]
          )
          )
         ),)
        ]
        )
      )
    );
  }

}