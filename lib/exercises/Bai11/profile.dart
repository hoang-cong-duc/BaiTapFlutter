import 'package:flutter/material.dart';
import 'login_api.dart';

class ProfilePage extends StatelessWidget {
  final int userId;

  const ProfilePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin người dùng'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: loginApi.getUser(userId), // ✅ ĐÚNG TÊN
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user['image']),
                ),
                SizedBox(height: 20),
                Text('Username: ${user['username']}',
                    style: TextStyle(fontSize: 18)),
                Text('Email: ${user['email']}',
                    style: TextStyle(fontSize: 18)),
                Text('Họ tên: ${user['firstName']} ${user['lastName']}',
                    style: TextStyle(fontSize: 18)),
                Text('Giới tính: ${user['gender']}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
