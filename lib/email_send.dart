
import 'package:flutter/material.dart';
import 'package:mailclient/email_widget.dart';
import 'package:mailclient/model/data.dart';

class EmailSendScreen extends StatefulWidget {
  final Mail mail;
  const EmailSendScreen({super.key, required this.mail});

  @override
  State<EmailSendScreen> createState() => _EmailSendScreenState();
}

class _EmailSendScreenState extends State<EmailSendScreen> {
 @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        focusColor: Colors.grey,
      ),
      appBar: AppBar(
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => EmailWidget(mail: mails[index]),
        itemCount: mails.length,
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

  