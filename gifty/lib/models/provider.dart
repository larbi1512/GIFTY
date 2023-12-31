class ProviderModel {
  final int id;
  final DateTime createdAt;
  final String storeName;
  final String email;
  final String password;
  final String location;
  final int phoneNumber;
  final String facebook;
  final String instagram;
  final String website;
  final String brandPic;

  ProviderModel({
    required this.id,
    required this.createdAt,
    required this.storeName,
    required this.email,
    required this.password,
    required this.location,
    required this.phoneNumber,
    required this.facebook,
    required this.instagram,
    required this.website,
    required this.brandPic,
  });
}