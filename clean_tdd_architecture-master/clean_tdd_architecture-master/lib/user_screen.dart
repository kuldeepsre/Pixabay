import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UserRepository.dart';
import 'UserRepositoryImpl.dart';
import 'bloc/multi_api/MultiApiBloc.dart';
import 'bloc/multi_api/MultiApiEvent.dart';
import 'bloc/multi_api/MultiApiState.dart';
import 'model/user.dart';
class UserPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users and Posts')),
      body: BlocConsumer<UserPostBloc, UserPostState>(
        listener: (context, state) {
          if (state is UserPostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is UserPostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserPostLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text('Users', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final user = state.users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Text('Posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Press the button to load data'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserPostBloc>().add(FetchUserAndPosts());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
