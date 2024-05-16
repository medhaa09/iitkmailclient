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
       resizeToAvoidBottomInset: true,
      body:Container(
        width:double.infinity,
        decoration: BoxDecoration(
          gradient:LinearGradient(
          colors: [Color(0xff000000), Color(0xff142b42)],
          stops: [0.1, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        ),
        
        child: ListView(
        children:<Widget>[
          Image.asset(
                    'assets/white.png',
                    width: 90, // Adjust width as needed
                    height: 90, // Adjust height as needed
                  ),
          
          Padding(
            padding: EdgeInsets.all(20),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children:<Widget>[
           Text("Login", style:TextStyle(color:Colors.white,fontSize:40,fontStyle: FontStyle.normal,fontFamily: 'Poppins',)),
           SizedBox(height:30,),
            ]
           ),
           ),
          SizedBox(height:20),
          Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color:Colors.white,
            ),
         child:Padding(
         padding:EdgeInsets.all(20),
         child:MyForm(),
        )
         ),
         ),
        ]
        ),
      )
    );
  }
}

//form widget
class MyForm extends StatefulWidget{
  const MyForm({super.key});
  @override 
  MyFormState createState(){
    return MyFormState();
  }
}
class MyFormState extends State<MyForm> {
  final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above
    return Form(
      
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
          validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }, 
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),),
              labelText: 'Username',
              ),
            ),
           ),
           
           Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextFormField(
          validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }, 
          obscureText: true, 
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),), 
            labelText: 'Password',
          ),
        ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.black), 
    
  ),
              child: const Text('Login',style:TextStyle(color:Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

