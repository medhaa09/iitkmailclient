import 'package:flutter/material.dart';

class ComposeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose Mail"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "To",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Subject",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  labelText: "Content",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle send action
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text('Send', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
