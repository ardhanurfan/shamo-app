class UserModel {
  final int id;
  final String name;
  final String email;
  final String username;
  final String profilePhotoUrl;
  final String token;

  const UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.profilePhotoUrl,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        profilePhotoUrl: json['profilePhotoUrl'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profilePhotoUrl': profilePhotoUrl,
      'token': token
    };
  }
}
