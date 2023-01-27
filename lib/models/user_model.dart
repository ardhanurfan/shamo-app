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

  factory UserModel.fromJson(Map<String, dynamic> json, String token) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        profilePhotoUrl: json['profile_photo_url'],
        token: token);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token
    };
  }
}
