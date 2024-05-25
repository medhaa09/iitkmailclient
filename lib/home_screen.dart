
// import 'package:flutter/material.dart';
// import 'package:mailclient/ComposeScreen/compose_screen.dart';
// import 'package:mailclient/email_widget.dart';
// import 'package:mailclient/model/data.dart';

// class EmailListScreen extends StatefulWidget {
//   const EmailListScreen({super.key});

//   @override
//   State<EmailListScreen> createState() => _EmailListScreenState();
// }

// class EmailTab {
//   final String text;
//   final IconData iconData;

//   EmailTab(this.text, this.iconData);
// }

// class _EmailListScreenState extends State<EmailListScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   List<EmailTab> tabs = [
//     EmailTab("Inbox", Icons.inbox_outlined),
//     EmailTab("Sent", Icons.send_outlined),
//     EmailTab("Star", Icons.star_border),
//   ];

//   @override
//   void initState() {
//     tabController = TabController(length: tabs.length, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => const MailComposeScreen(),
//   ),
// );
// },
//         child: const Icon(Icons.edit),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         focusColor: Colors.grey,
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide.none,
//             ),
//             filled: true,
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//             prefixIcon: Icon(Icons.search),
//           ),
//         ),
//       ),
//       body: ListView.separated(
//         itemBuilder: (context, index) => EmailWidget(mail: mails[index]),
//         itemCount: mails.length,
//         separatorBuilder: (context, index) => Divider(
//           thickness: 0.3,
//           indent: MediaQuery.of(context).size.width * 0.1,
//           endIndent: MediaQuery.of(context).size.width * 0.1,
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         child: SafeArea(
//           child: TabBar(
//             controller: tabController,
//             indicatorColor: Colors.black,
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.grey,
//             tabs: List.generate(
//               tabs.length,
//               (index) => Tab(
//                 height: 50,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(tabs[index].iconData),
//                     const SizedBox(height: 2),
//                     Text(tabs[index].text),
//                     const SizedBox(height: 2),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mailclient/ComposeScreen/compose_screen.dart';
import 'package:mailclient/email_widget.dart';
import 'package:mailclient/model/data.dart';

class EmailListScreen extends StatefulWidget {
  const EmailListScreen({super.key});

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

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MailComposeScreen(),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => EmailWidget(mail: mails[index]),
              itemCount: mails.length,
              separatorBuilder: (context, index) => Divider(
                thickness: 0.3,
                indent: MediaQuery.of(context).size.width * 0.1,
                endIndent: MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          ],
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


  