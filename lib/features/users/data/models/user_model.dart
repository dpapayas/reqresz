import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? avatar,
  }) : super(
          id: id ?? '',
          firstName: firstName ?? '',
          lastName: lastName ?? '',
          email: email ?? '',
          avatar: avatar ?? '',
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'avatar': avatar,
    };
  }
}
