import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:mailclient/email_view.dart';
import 'package:mailclient/model/data.dart';

class EmailWidget extends StatelessWidget {
  final Mail mail;
  const EmailWidget({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:(){
        Navigator.push(context,
        MaterialPageRoute(
          builder:(context)=> EmailViewScreen(mail: mail)));
      },
      leading: CircleAvatar(
        backgroundImage: mail.profileImage != null
            ? NetworkImage(mail.profileImage!)
            : const AssetImage('assets/default_profile.png') as ImageProvider,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mail.userName ?? 'Unknown User',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            mail.subject ?? 'No Subject',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           mail.body != null
           ? (mail.body!.length > 100
          ? "${mail.body!.substring(0, 100)}..."
          : mail.body!)
           : '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            GetTimeAgo.parse(mail.time ?? DateTime.now()),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
