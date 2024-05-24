class Mail {
  final String subject;
  final String body;
  final DateTime time;
  final bool isRead;
  final String userName;
  final String profileImage;

  Mail({
    required this.subject,
    required this.userName,
    required this.body,
    required this.time,
    required this.profileImage,
    this.isRead = false,
  });
}

List<Mail> mails = [
  Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ), Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: 'This is the content of the welcome mail.',
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
];
