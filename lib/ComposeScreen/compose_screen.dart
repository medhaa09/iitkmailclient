// import 'package:flutter/material.dart';

// class MailComposeScreen extends StatefulWidget {
//   const MailComposeScreen({super.key});

//   @override
//   _MailComposeScreenState createState() => _MailComposeScreenState();
// }

// class _MailComposeScreenState extends State<MailComposeScreen> {
//   final TextEditingController _recipientController = TextEditingController();
//   final TextEditingController _subjectController = TextEditingController();
//   final TextEditingController _bodyController = TextEditingController();

//   void _sendMail() {
//     // Placeholder function to handle sending email logic
//     print("Recipient: ${_recipientController.text}");
//     print("Subject: ${_subjectController.text}");
//     print("Body: ${_bodyController.text}");

//     // Clear the text fields after sending
//     _recipientController.clear();
//     _subjectController.clear();
//     _bodyController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Compose Email'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.send),
//             onPressed: _sendMail,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _recipientController,
//               decoration: const InputDecoration(
//                 labelText: 'To',
//                 hintText: 'Recipient',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextField(
//               controller: _subjectController,
//               decoration: const InputDecoration(
//                 labelText: 'Subject',
//                 hintText: 'Email Subject',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: TextField(
//                 controller: _bodyController,
//                 decoration: const InputDecoration(
//                   labelText: 'Body',
//                   hintText: 'Email Body',
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: null,
//                 expands: true,
//                 keyboardType: TextInputType.multiline,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';

class MailComposeScreen extends StatefulWidget {
  const MailComposeScreen({super.key});

  @override
  _MailComposeScreenState createState() => _MailComposeScreenState();
}

class _MailComposeScreenState extends State<MailComposeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recipientController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _recipientController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    const String smtpServer = 'smtp.example.com';
    const String userName = 'your-username';
    const String password = 'your-password';
    const String senderEmail = 'your-email@example.com';

    final email = '$userName@$smtpServer';
    final config = await Discover.discover(email);

    if (config == null) {
      print('Unable to auto-discover settings for $email');
      return;
    }

    final account = MailAccount.fromDiscoveredSettings('my account', email, password, config);
    final mailClient = MailClient(account, isLogEnabled: true);

    try {
      await mailClient.connect();
      print('Connected to ${config.displayName}.');

      final builder = MessageBuilder()
        ..from = [const MailAddress('Sender Name', senderEmail)]
        ..to = [MailAddress('Recipient Name', _recipientController.text)]
        ..subject = _subjectController.text
        ..text = _bodyController.text;

      final mimeMessage = builder.buildMimeMessage();
      await mailClient.sendMessage(mimeMessage);

      print('Email sent successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sent successfully')),
      );
    } catch (e) {
      print('Failed to send email: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send email: $e')),
      );
    } finally {
      await mailClient.disconnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _recipientController,
                decoration: const InputDecoration(labelText: 'Recipient'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipient email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(labelText: 'Subject'),
              ),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(labelText: 'Body'),
                maxLines: 10,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendEmail();
                  }
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
