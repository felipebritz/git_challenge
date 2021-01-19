import 'package:dio/dio.dart';
import 'package:git_challenge/models/user.dart';

class GitService {
  var dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
  var count = 0;

  Future<List<String>> searchUsers(
    String name,
    int perPage,
    int page,
  ) async {
    try {
      var response = await dio.get(
        '/search/users?q=$name&per_page=$perPage&page=$page',
        options: Options(
          headers: {
            'Accept': 'vnd.github.v3+json',
          },
        ),
      );
      count = response.data['total_count'];
      return (response.data['items'] as List<dynamic>)
          .map((user) => user['login'].toString())
          .toList();
    } catch (e) {
      print(e);
      return <String>[];
    }
  }

  Future<User> getUser(String username) async {
    try {
      var response = await dio.get(
        '/users/$username',
        options: Options(
          headers: {
            'Accept': 'vnd.github.v3+json',
          },
        ),
      );
      return User.fromMap(response.data);            
    } catch (e) {
      print(e);
      return User();
    }
  }


}
