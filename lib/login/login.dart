// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mailclient/home_screen.dart';
class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

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
                    width: 90,
                    height: 90, 
                  ),
          
          Padding(
            padding: EdgeInsets.all(20),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children:<Widget>[
          Text("Login", style:TextStyle(color:Colors.white,fontSize:32,fontStyle: FontStyle.normal,fontFamily: 'Roboto',)),
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
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailListScreen(),
                    ),
                  );
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
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Add the http package for making HTTP requests
// import 'package:mailclient/home_screen.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xff000000), Color(0xff142b42)],
//             stops: [0.1, 1],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView(
//           children: <Widget>[
//             Image.asset(
//               'assets/white.png',
//               width: 90,
//               height: 90,
//             ),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontStyle: FontStyle.normal,
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(25)),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: MyForm(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Form widget
// class MyForm extends StatefulWidget {
//   const MyForm({super.key});
//   @override
//   MyFormState createState() {
//     return MyFormState();
//   }
// }

// class MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;
//   String? _errorMessage;

//   Future<void> _login() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     final response = await http.post(
//       Uri.parse('https://nwm.iitk.ac.in/?_task=login'), // Replace with your actual endpoint
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'username': _usernameController.text,
//         'password': _passwordController.text,
//       }),
//     );

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON.
//       final data = jsonDecode(response.body);
//       if (data['success']) {
//         // Navigate to the email list screen if login is successful
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => EmailListScreen(),
//           ),
//         );
//       } else {
//         setState(() {
//           _errorMessage = data['message'];
//         });
//       }
//     } else {
//       setState(() {
//         _errorMessage = 'Failed to authenticate. Please try again.';
//       });
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: TextFormField(
//               controller: _usernameController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your username';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 labelText: 'Username',
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: TextFormField(
//               controller: _passwordController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 return null;
//               },
//               obscureText: true,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 labelText: 'Password',
//               ),
//             ),
//           ),
//           if (_errorMessage != null) ...[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Text(
//                 _errorMessage!,
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//           ],
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             child: ElevatedButton(
//               onPressed: _isLoading ? null : _login,
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
//               ),
//               child: _isLoading
//                   ? CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     )
//                   : Text('Login', style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



