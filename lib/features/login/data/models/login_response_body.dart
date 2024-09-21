class LoginResponseBody {
  final bool? status;
  final String? message;
  final UserData? data;

  LoginResponseBody({this.status, this.message, this.data});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      LoginResponseBody(
          status: json['status'],
          message: json['message'],
          data: json['data'] != null ? UserData.fromJson(json['data']) : null);
}

class UserData {
  final int? id;
  final String? name;
  final String? email;
  final dynamic phone;
  final String? image;
  final String? token;

  UserData(
      {this.id, this.name, this.email, this.phone, this.image, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token'],
      );
}
