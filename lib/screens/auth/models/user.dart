// class User {
//   final String username;
//   final String email;
//   final String firstName;
//   final String lastName;
//   final String phone;
//   final String githubUrl;
//   final String linkedinUrl;
//   const User(
//       {required this.phone,
//         required this.githubUrl,
//         required this.linkedinUrl,
//         required this.username,
//         required this.email,
//         required this.firstName,
//         required this.lastName});
  //
  // static User? _currentUser;
  //
  // static User? get currentUser {
  //   return _currentUser;
  // }
  //
  // static Future<String?> getToken() async {
  //   final sharedPrefs = await SharedPreferences.getInstance();
  //   final token = sharedPrefs.getString('token');
  //   if (token != null && _currentUser == null) {
  //     try {
  //       _currentUser = await getCurrentUser();
  //     } on HttpException {
  //       _currentUser = null;
  //     }
  //   }
  //   return token;
  // }
  //
  // static Stream<String?> token = Stream.periodic(
  //   Duration.zero,
  // ).asyncMap((_) => getToken());
  //
  // static Future<User> login(String username, String password) async {
  //   final body = {
  //     'username': username,
  //     'password': password,
  //   };
  //   final response =
  //   await http.post(getBaseUrl('/auth/login/'), body: jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final sharedPrefs = await SharedPreferences.getInstance();
  //     sharedPrefs.setString('token', data['token']);
  //     return User(
  //       username: data['user']['username'] ?? '',
  //       email: data['user']['email'] ?? '',
  //       firstName: data['user']['first_name'] ?? '',
  //       lastName: data['user']['last_name'] ?? '',
  //       phone: data['user']['phone'] ?? '',
  //       githubUrl: data['user']['github'] ?? '',
  //       linkedinUrl: data['user']['linkedin'] ?? '',
  //     );
  //   } else if (response.statusCode == 400) {
  //     throw BadRequest400('Bad request');
  //   } else if (response.statusCode == 403) {
  //     throw Forbidden403('wrong password');
  //   } else if (response.statusCode == 404) {
  //     throw NotFound404('user not found');
  //   }
  //   throw const HttpException('some error occured');
  // }
  //
  // static Future<void> logout() async {
  //   final sharedPrefs = await SharedPreferences.getInstance();
  //   sharedPrefs.remove('token');
  // }
  //
  // static Future<User> getCurrentUser() async {
  //   final body = {
  //     'token': (await SharedPreferences.getInstance()).getString('token') ?? '',
  //   };
  //   final response =
  //   await http.post(getBaseUrl('/auth/get-user/'), body: jsonEncode(body));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return User(
  //         username: data['username'] ?? '',
  //         email: data['email'] ?? '',
  //         firstName: data['first_name'] ?? '',
  //         lastName: data['last_name'] ?? '',
  //         phone: data['phone'] ?? '',
  //         githubUrl: data['github'] ?? '',
  //         linkedinUrl: data['linkedin'] ?? '');
  //   } else if (response.statusCode == 400) {
  //     throw BadRequest400('Bad request');
  //   } else if (response.statusCode == 403) {
  //     throw Forbidden403('wrong password');
  //   } else if (response.statusCode == 404) {
  //     throw NotFound404('user not found');
  //   }
  //   throw const HttpException('some error occured');
  // }
  //
  // Future<User> changePassword(
  //     String currentPassword, String newPassword) async {
  //   final body = {
  //     "username": username,
  //     "password": currentPassword,
  //     "new_password": newPassword
  //   };
  //   final response = await http.post(getBaseUrl('/auth/change-password/'),
  //       body: jsonEncode(body));
  //   if (response.statusCode == 202) {
  //     return this;
  //   } else if (response.statusCode == 400) {
  //     throw BadRequest400('Bad request');
  //   } else if (response.statusCode == 403) {
  //     throw Forbidden403('wrong password');
  //   } else if (response.statusCode == 404) {
  //     throw NotFound404('user not found');
  //   }
  //   throw const HttpException('some error occured');
  // }
  //
  // Future<User> changeDetails(
  //     [String? email,
  //       String? phone,
  //       String? githubUrl,
  //       String? linkedinUrl]) async {
  //   final body = {
  //     'token': await User.getToken(),
  //     'email': email,
  //     'phone': phone,
  //     'github': githubUrl,
  //     'linkedin': linkedinUrl
  //   };
  //   final response = await http.post(getBaseUrl('/auth/change-details/'),
  //       body: jsonEncode(body));
  //   if (response.statusCode == 202) {
  //     _currentUser = await getCurrentUser();
  //     return this;
  //   } else if (response.statusCode == 400) {
  //     throw BadRequest400('Bad request');
  //   } else if (response.statusCode == 404) {
  //     throw NotFound404('user not found');
  //   }
  //   throw const HttpException('some error occured');
  // }
  //
  // static Future<User> getUserById(int id) async {
  //   final response = await http.get(getBaseUrl('/auth/get-user-by-id/$id/'));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     return User(
  //         username: data['username'] ?? '',
  //         email: data['email'] ?? '',
  //         firstName: data['first_name'] ?? '',
  //         lastName: data['last_name'] ?? '',
  //         phone: data['phone'] ?? '',
  //         githubUrl: data['github'] ?? '',
  //         linkedinUrl: data['linkedin'] ?? '');
  //   } else if (response.statusCode == 404) {
  //     throw NotFound404('user not found');
  //   }
  //   throw const HttpException('some error occured');
  // }
  //
  // static Future<Map<String, String>> get authHeader async {
  //   return {'Authorization': 'Token ${(await getToken())}'};
  // }
// }
