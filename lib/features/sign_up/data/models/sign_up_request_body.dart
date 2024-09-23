class SignUpRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String image;

  SignUpRequestBody(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'image': image,
    };
  }
}
