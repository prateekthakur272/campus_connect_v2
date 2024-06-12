import 'package:campus_connect_v2/core/api_client/api_client.dart';
import 'package:flutter/cupertino.dart';

@immutable
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
  });

  factory User.fromJson(Json data) {
    return User(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      avatarUrl: data['avatarUrl'],
    );
  }

  String get fullName =>'$firstName $lastName';

  Json toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'avatarUrl': avatarUrl
    };
  }
}
