import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';

class ComposeScreen extends StatefulWidget {
  const ComposeScreen({super.key});
  @override
  _ComposeScreenState createState() => _ComposeScreenState();
}

class _ComposeScreenState extends State<ComposeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _toController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  String userName = 'medhaagar23';
  String password = '';
  String domain = 'iitk.ac.in';
  String smtpServer = 'mmtp.iitk.ac.in';
  int smtpPort = 25; 

  @override
  void dispose() {
    _toController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final toAddress = _toController.text;
    final subject = _subjectController.text;
    final body = _bodyController.text;

    final client = SmtpClient(smtpServer, isLogEnabled: true);

    try {
      // Connect to the SMTP server
      await client.connectToServer(smtpServer, smtpPort, isSecure: false);

      // Authenticate with the server
      await client.ehlo();
      await client.startTls();
      await client.authenticate(userName, password, AuthMechanism.login);

      // Create the email
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: body,
        htmlText: '<p>$body</p>',
      )
        ..from = [MailAddress('Medha', '$userName@$domain')]
        ..to = [MailAddress('', toAddress)]
        ..subject = subject;

      final mimeMessage = builder.buildMimeMessage();

      // Send the email
      await client.sendMessage(mimeMessage);
      print('Email sent successfully');
    } catch (e) {
      print('Failed to send email: $e');
    } finally {
      await client.disconnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose Email'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendEmail,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _toController,
                decoration: const InputDecoration(
                  labelText: 'To',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipient';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                ),
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email body';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
