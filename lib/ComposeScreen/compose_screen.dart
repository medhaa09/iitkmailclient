import 'package:flutter/material.dart';

class MailComposeScreen extends StatefulWidget {
  const MailComposeScreen({super.key});

  @override
  _MailComposeScreenState createState() => _MailComposeScreenState();
}

class _MailComposeScreenState extends State<MailComposeScreen> {
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  void _sendMail() {
    // Placeholder function to handle sending email logic
    print("Recipient: ${_recipientController.text}");
    print("Subject: ${_subjectController.text}");
    print("Body: ${_bodyController.text}");

    // Clear the text fields after sending
    _recipientController.clear();
    _subjectController.clear();
    _bodyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose Email'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMail,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(
                labelText: 'To',
                hintText: 'Recipient',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                hintText: 'Email Subject',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  hintText: 'Email Body',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
