class GoogleUserData {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String idToken;

  GoogleUserData({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.idToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'idToken': idToken,
    };
  }
}
