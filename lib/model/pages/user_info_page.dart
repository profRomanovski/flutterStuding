import 'package:flutter/material.dart';

import 'package:study_project/model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;

  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Visibility(
              child: ListTile(
                title: Text(
                  '${userInfo.name}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text('${userInfo.story}'),
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                trailing: Text('${userInfo.country}'),
              ),
              visible: true,
            ),
            ListTile(
              title: Text(
                '${userInfo.phone}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            Visibility(
              child: ListTile(
                title: Text(
                  '${userInfo.email.isEmpty ? 'Not specified' : userInfo.email}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
              ),
              visible: userInfo.email.isNotEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
