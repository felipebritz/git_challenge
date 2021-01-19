class User {
  String login;
  String avatarUrl;
  int publicRepos;
  int followers;
  int following;

  User();

  User.fromMap(Map<String, dynamic> map)
    : login = map['login'],
      avatarUrl = map['avatar_url'],
      publicRepos = map['public_repos'],
      followers = map['followers'],
      following = map['following']
    ;
}