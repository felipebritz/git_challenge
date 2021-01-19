import 'package:flutter/material.dart';
import 'package:git_challenge/models/user.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(user.avatarUrl),
              ),
            ),
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login: ${user?.login}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5,),
                Text(
                  'Public Repositories: ${user.publicRepos??''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5,),
                Text(
                  'Followers: ${user.followers??''}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5,),
                Text(
                  'Following: ${user.following??''}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
