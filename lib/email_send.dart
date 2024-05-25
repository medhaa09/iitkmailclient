
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
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
        actions:[
          IconButton(onPressed:(){}, icon:const Icon(Icons.chevron_left), )
        ],
      ),
      body: 
      Padding(
        padding:const EdgeInsets.symmetric(horizontal:16.0),
        child:
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ListTile(
            contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: widget.mail.profileImage != null
            ? NetworkImage(widget.mail.profileImage!)
            : const AssetImage('assets/default_profile.png') as ImageProvider,
      ),
      title:
       
          Text(
            widget.mail.userName ?? 'Unknown User',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ), 
          trailing:Text(
            GetTimeAgo.parse(widget.mail.time ?? DateTime.now()),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 12),
          ),
      ),
      
        const SizedBox(height:16),
        // ignore: unnecessary_null_comparison
        Text(widget.mail!=null? widget.mail.subject:"",
        style:Theme.of(context).textTheme.headlineSmall
        ),
        const SizedBox(height:8),
        // ignore: unnecessary_null_comparison
        Text(widget.mail!=null? widget.mail.body:"",
        style:Theme.of(context).textTheme.bodyMedium
        ),
        ],
      ),
      ),
    );
  }
}

  