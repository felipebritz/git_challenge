import 'package:flutter/material.dart';
import 'package:git_challenge/pages/user_page.dart';
import 'package:git_challenge/services/git_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var git = GitService();
  var page = 1;
  static const perPage = 20;
  TextEditingController _userController = TextEditingController();
  List<String> loginList = <String>[];

  void _onPressedSearch() {
    page = 1;
    git.searchUsers(_userController.text, perPage, page).then((value) {
      setState(() {
        loginList = value;
      });
    });
  }

  void _onPressedMore() {
    page++;
    git.searchUsers(_userController.text, perPage, page).then((value) {
      setState(() {
        loginList.addAll(value);
      });
    });
  }

  void _onPressedUserCard(String username) {
    git.getUser(username).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserPage(
            user: value,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: Image.asset(
          'assets/images/GitHub-Mark-32px.png',
          color: Colors.white,
        ),
        title: TextField(
          controller: _userController,
          style: TextStyle(
            color: Colors.grey[300],
          ),
          decoration: InputDecoration(
              isDense: true,
              hintText: 'Pesquisar usuário',
              hintStyle: TextStyle(
                color: Colors.grey[300],
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.grey[300],
                ),
                onPressed: _onPressedSearch,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: page * perPage < git.count
              ? loginList.length + 1
              : loginList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < loginList.length) {
              return Card(
                child: ListTile(
                  title: Text(loginList[index]),
                  onTap: () {
                    _onPressedUserCard(loginList[index]);
                  },
                ),
              );
            }
            return Card(
              child: ListTile(
                leading: Icon(Icons.arrow_forward),
                title: Text('Mais usuários'),
                onTap: _onPressedMore,
              ),
            );
          },
        ),
      ),
    );
  }
}
