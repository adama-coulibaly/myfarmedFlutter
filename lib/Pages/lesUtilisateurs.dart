import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfarmed/Models/users.dart';
import 'package:myfarmed/Services/FireBase/usersRegistration.dart';

class allUsers extends StatefulWidget {
  const allUsers({Key? key}) : super(key: key);

  @override
  State<allUsers> createState() => _allUsersState();
}

class _allUsersState extends State<allUsers> {
  usersRegistration users = usersRegistration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<User>>(
        stream: users.allUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur ! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return ListView(
              children: user.map(buildUder).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Widget buildUder(User user) => ListTile(
      leading: CircleAvatar(
        child: Text('${user.statut}'),
      ),
      title: Text('${user.nom}'),
      subtitle: Text('${user.prenom}'),
    );
