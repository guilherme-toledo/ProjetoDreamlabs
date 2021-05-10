import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste1/user.dart';
import 'api.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto dreamlabs',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BuildListView(),
    );
  }
}
class BuildListView extends StatefulWidget {
  @override
  createState() => _BuildListViewState();
}
class _BuildListViewState extends State {
  var users = new List<User>();
  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }
  initState() {
    super.initState();
    _getUsers();
  }
  dispose() {
    super.dispose();
  }
  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Projeto dreamlabs')
            ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Padding(padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Column(
                  children: [
                    Text('-------------------------------------------------------------------------------------------------'),
                    ListTile(
                      title: Text(users[index].title),
                      subtitle: Text(users[index].body),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => DetailScreen(user: users[index])
                        ),
                        );
                        },
                    ),

                  ],
                  
                )
            );
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  final User user;
  DetailScreen({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(user.body),
      ),
    );
  }
}