
import 'package:flutter/material.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:mailclient/email_widget.dart';
import 'package:mailclient/login/login.dart';
import 'package:mailclient/model/data.dart';
import 'package:mailclient/backend/EmailService.dart';
import 'package:mailclient/compose_screen.dart';

class EmailListScreen extends StatefulWidget {
  final String user;

  const EmailListScreen({super.key, required this.user});

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
late EmailService _emailService;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
     _emailService = EmailService(
      userName:'',
      password: '',
      domain: 'iitk.ac.in',
     Server: 'qasid.iitk.ac.in',
      Port: 143,
    );
       fetchMails();
  }
  
  Future<void> fetchMails() async {
    try {
      final messages = await _emailService.fetchMails();
      setState(() {
        inboxMails = messages;
        isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch emails: $e');
    }
  }
  

  Mail convertMimeMessageToMail(MimeMessage mimeMessage) {
     
  final subject = mimeMessage.decodeSubject() ?? 'No Subject';
  final userNameField = mimeMessage.from?.toString() ?? 'Unknown Sender';

  final RegExp regExp = RegExp(r'"([^"]*)"');
  final match = regExp.firstMatch(userNameField);
  final userName = match != null ? match.group(1) : userNameField;
 
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
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      focusColor: Colors.grey,
      child: const Icon(Icons.edit),
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
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                widget.user,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
             ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
              
                Navigator.pop(context); // Closes the drawer
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _emailService.logout(); 
                Navigator.pop(context); // Closes the drawer
                 Navigator.push(
                  context,
                   MaterialPageRoute(
                   builder: (context) => const LoginPage(),
                   ),
                );
                
              },
            ),
          ],
        ),
    ),
    body:  RefreshIndicator(
        onRefresh: fetchMails,
         color: Colors.black, 
        child: isLoading
        ? const Center(child: CircularProgressIndicator())
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

