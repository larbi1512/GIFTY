class User {
  final int id;
  final DateTime createdAt;
  final String username;
  final String name;
  final String email;
  final String password;
  final String wilaya;
  final int phoneNumber;
  final String profilePic;

  User({
    required this.id,
    required this.createdAt,
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.wilaya,
    required this.phoneNumber,
    required this.profilePic,
  });
}