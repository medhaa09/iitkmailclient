
import 'package:enough_mail/enough_mail.dart';

class EmailService {
  final String userName;
  final String password;
  final String domain;
  final String Server;
  final int Port;

  EmailService({
    required this.userName,
    required this.password,
    required this.domain,
    required this.Server,
    required this.Port,
  });

  Future<String> sendEmail(String toAddress, String subject, String body) async {
    final client = SmtpClient(Server, isLogEnabled: true);

    try {
      // Connecting to the SMTP server
      await client.connectToServer(Server, Port, isSecure: false);

      // Authenticating with the server
      await client.ehlo();
      await client.startTls();
      await client.authenticate(userName, password, AuthMechanism.login);

      // Creating the email
      final builder = MessageBuilder.prepareMultipartAlternativeMessage(
        plainText: body,
        htmlText: '<p>$body</p>',
      )
        ..from = [MailAddress('Medha', '$userName@$domain')]
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


  Future<List<MimeMessage>> fetchMails() async {
    final client = ImapClient(isLogEnabled: true);
    try {
      await client.connectToServer(Server, Port, isSecure: false);
      await client.login(userName, password);
      await client.selectInbox();

      final fetchResult = await client.fetchRecentMessages(
          messageCount: 15, criteria: 'BODY.PEEK[]');
      return fetchResult.messages;
    } catch (e) {
      print('Failed to fetch emails: $e');
      return [];
    } finally {
      await client.logout();
      await client.disconnect();
    }
  }
}

