
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailclient/email_widget.dart';
import 'package:mailclient/model/data.dart';
import 'package:mailclient/ComposeScreen/compose_screen.dart';

class EmailListScreen extends StatefulWidget {
  const EmailListScreen({Key? key}) : super(key: key);

  @override
  State<EmailListScreen> createState() => _EmailListScreenState();
}

class EmailTab {
  final String text;
  final IconData iconData;

  EmailTab(this.text, this.iconData);
}

class _EmailListScreenState extends State<EmailListScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<EmailTab> tabs = [
    EmailTab("Inbox", Icons.inbox_outlined),
    EmailTab("Sent", Icons.send_outlined),
    EmailTab("Star", Icons.star_border),
  ];

  List<MimeMessage> inboxMails = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    fetchMails();
  }

  
  Future<void> fetchMails() async {
  String userName = 'medhaagar23';
  String password = 'petPN67#\$t'; 
  String domain = 'iitk.ac.in';
  String email = '$userName@$domain';

  final client = ImapClient(isLogEnabled: true);
  try {
    await client.connectToServer('qasid.iitk.ac.in', 143, isSecure: false);
    await client.login(userName, password);
    await client.selectInbox();

    final fetchResult = await client.fetchRecentMessages(
        messageCount: 15, criteria: 'BODY.PEEK[]');
    setState(() {
      inboxMails = fetchResult.messages;
     
      isLoading = false;
    });
  } catch (e) {
    print('Failed to fetch emails: $e');
  } finally {
    
    await client.logout();
    await client.disconnect();
  }
}

  Mail convertMimeMessageToMail(MimeMessage mimeMessage) {
     
  final subject = mimeMessage.decodeSubject() ?? 'No Subject';
  final userNameField = mimeMessage.from?.toString() ?? 'Unknown Sender';
  // Use a regular expression to extract the part inside double quotes
  final RegExp regExp = RegExp(r'"([^"]*)"');
  final match = regExp.firstMatch(userNameField);
  final userName = match != null ? match.group(1) : userNameField;
 // print(userName); 
    final date = mimeMessage.decodeDate() ?? DateTime(1970, 1, 1);
    final body = mimeMessage.decodeTextPlainPart() ?? 'No Body';

    return Mail(
      subject: subject,
      userName: userName!,
      time: date,
      body: body,
      profileImage: '', 
    );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ComposeScreen(),
          ),
        );
      },
      child: const Icon(Icons.edit),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      focusColor: Colors.grey,
    ),
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            itemCount: inboxMails.length,
            itemBuilder: (context, index) {
              final mail = convertMimeMessageToMail(inboxMails[index]);
              return EmailWidget(mail: mail);
            },
            separatorBuilder: (context, index) => Divider(
              thickness: 0.3,
              indent: MediaQuery.of(context).size.width * 0.1,
              endIndent: MediaQuery.of(context).size.width * 0.1,
            ),
          ),
    bottomNavigationBar: Container(
      color: Colors.white,
      child: SafeArea(
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: List.generate(
            tabs.length,
            (index) => Tab(
              height: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(tabs[index].iconData),
                  const SizedBox(height: 2),
                  Text(tabs[index].text),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

  }

