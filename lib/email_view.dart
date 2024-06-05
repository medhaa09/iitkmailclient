
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:mailclient/model/data.dart';

class EmailViewScreen extends StatefulWidget {
  final Mail mail;
  const EmailViewScreen({super.key, required this.mail});

  @override
  State<EmailViewScreen> createState() => _EmailViewScreenState();
}

class _EmailViewScreenState extends State<EmailViewScreen> {
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
        actions: [
          IconButton(onPressed: () {
            Navigator.pop(context);  // To navigate back to the previous screen
          }, icon: const Icon(Icons.chevron_left),)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: widget.mail.profileImage != null
                    ? NetworkImage(widget.mail.profileImage!)
                    : const AssetImage('assets/default_profile.png') as ImageProvider,
              ),
              title: Text(
                widget.mail.userName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                GetTimeAgo.parse(widget.mail.time),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.mail.subject,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              widget.mail.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}


  