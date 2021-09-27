import 'package:base/application/config.dart';
import 'package:base/core/user.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;


class APIService {

  late Dio _client;

  APIService() {
    fb_auth.FirebaseAuth.instance.userChanges().listen((user) async {
      await _setupClient(user);
    });
  }

  Future<APIService> init() async {
    await _setupClient(fb_auth.FirebaseAuth.instance.currentUser);
    return this;
  } 

  Future<User> createUser(User user) async {
    var response = await _client.post('/users', data: user.toJson());
    return User.fromJson(response.data);
  }

  Future<User?> fetchUser(String id) async {
    var response = await _client.get('/users/$id');
    return response.statusCode == 200 
      ? User.fromJson(response.data) 
      : null;
  }

  Future _setupClient(fb_auth.User? currentUser) async {
    if (currentUser != null) {
        _client = Dio(BaseOptions(
          baseUrl: Config.apiUrl,
          headers: {
            'Authorization': 'Bearer ${await currentUser.getIdToken()}'
          },
        ));
      } else {
        _client = Dio(BaseOptions(
          baseUrl: Config.apiUrl,
        ));
      }
  }
}