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
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   Mail(
    profileImage: "",
    subject: 'Welcome to the mail client',
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    time: DateTime.now().subtract(const Duration(hours:3)),
    userName:'Patrick James',
    isRead: true,
  ),
   
];
