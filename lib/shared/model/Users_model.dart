class UsersModel{
  const UsersModel({this.profilePhoto1, required this.name, required this.profilePhoto, required this.lastSeen, required this.lastMessage, required this.isGroup});

  final String name;
  final String profilePhoto;
  final String? profilePhoto1;
  final String lastMessage;
  final bool isGroup;
  final DateTime lastSeen;
}