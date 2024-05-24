
import 'package:flutter/material.dart';
import 'package:mailclient/email_widget.dart';
import 'package:mailclient/model/data.dart';

class EmailListScreen extends StatefulWidget {
  const EmailListScreen({super.key});

  @override
  State<EmailListScreen> createState() => _EmailListScreenState();
}

class EmailTab{
  final String text;
  final IconData iconData;

EmailTab(this.text,this.iconData);
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
  
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(82),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              TabBar(
                controller: tabController,
                tabs: List.generate(
                  tabs.length,
                  (index) => Tab(
                    height: 50,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(tabs[index].iconData),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(tabs[index].text),
                        const SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body:ListView.separated(itemBuilder: (context,index)=>EmailWidget(mail:mails[index]),
      itemCount:mails.length,
      separatorBuilder: (context,index)=>Divider(thickness:0.3,
      indent:MediaQuery.of(context).size.width*0.1,
      endIndent: MediaQuery.of(context).size.width*0.1,
      ),
      )
    );
  }
}
  