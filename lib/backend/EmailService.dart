

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:enough_mail/enough_mail.dart';

class EmailService {
  final String userName;
  final String password;
  final String domain;
  final String Server;
  final int Port;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  EmailService({
    required this.userName,
    required this.password,
    required this.domain,
    required this.Server,
    required this.Port,
  });


Future<void> loginAndStoreSession() async {
  final client = ImapClient(isLogEnabled: true);
  try {
    await client.connectToServer(Server, Port, isSecure: false);
    await client.login(userName, password);
    await client.selectInbox();

    // Storing session information 
    await secureStorage.write(key: 'loggedIn', value: 'true');
    await secureStorage.write(key: 'username', value: userName);
    await secureStorage.write(key: 'password', value: password);

    print('Logged in successfully!');
    
  } catch (e) {
    print('Failed to login: $e');
  } finally {
    await client.logout();
    await client.disconnect();
  }
}


   Future<List<MimeMessage>> fetchMails() async {
    final client = ImapClient(isLogEnabled: true);
    try {
      // to check if user is logged in
      final isLoggedIn = await secureStorage.read(key: 'loggedIn');
      if (isLoggedIn != 'true') {
        throw Exception('User not logged in');
      }

      final storedUsername = await secureStorage.read(key: 'username');
      final storedPassword = await secureStorage.read(key: 'password');

      await client.connectToServer(Server, Port, isSecure: false);
      await client.login(storedUsername!, storedPassword!);
      await client.selectInbox();

      final fetchResult = await client.fetchRecentMessages(
        messageCount: 15, criteria: 'BODY.PEEK[]');
    
    // Sort messages from most recent to least
    fetchResult.messages.sort((a, b) {
      final aDate = a.decodeDate() ?? DateTime(1970, 1, 1);
      final bDate = b.decodeDate() ?? DateTime(1970, 1, 1);
      return bDate.compareTo(aDate);
    });

    return fetchResult.messages;
  } catch (e) {
    print('Failed to fetch emails: $e');
    return [];
  } finally {
    await client.logout();
    await client.disconnect();
  }

  }

  Future<String> sendEmail(String toAddress, String subject, String body) async {
    final client = SmtpClient(Server, isLogEnabled: true);
    try {
     
      final isLoggedIn = await secureStorage.read(key: 'loggedIn');
      if (isLoggedIn != 'true') {
        throw Exception('User not logged in');
      }

      final storedUsername = await secureStorage.read(key: 'username');
      final storedPassword = await secureStorage.read(key: 'password');

      await client.connectToServer(Server, Port, isSecure: false);


      await client.ehlo();
      await client.startTls();
      await client.authenticate(storedUsername!, storedPassword!,
          AuthMechanism.login);

      // Creating the email
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: body,
        htmlText: '<p>$body</p>',
      )
        ..from = [MailAddress('Medha', '$storedUsername@$domain')]
        ..to = [MailAddress('', toAddress)]
        ..subject = subject;

      final mimeMessage = builder.buildMimeMessage();

      // Sending the email
      await client.sendMessage(mimeMessage);
      return 'Email sent successfully';
    } catch (e) {
      return 'Failed to send email: $e';
    } finally {
      await client.disconnect();
    }
  }

  Future<void> logout() async {
    // Clearing session information
    await secureStorage.delete(key: 'loggedIn');
    await secureStorage.delete(key: 'username');
    await secureStorage.delete(key: 'password');
  }
}

