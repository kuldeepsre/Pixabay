import 'package:flutter/material.dart';

import 'UserRepository.dart';
import 'UserRepositoryImpl.dart';
import 'model/user.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Repository _userRepository;
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userRepository = RepositoryImpl();
    _userFuture = _userRepository.getUser(1); // Fetch user with ID 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: ${user.id}'),
                  Text('Name: ${user.name}'),
                  Text('Email: ${user.email}'),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}

