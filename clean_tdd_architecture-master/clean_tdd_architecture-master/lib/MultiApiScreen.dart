import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/multi_api/MultiApiBloc.dart';
import 'bloc/multi_api/MultiApiEvent.dart';
import 'bloc/multi_api/MultiApiState.dart';


class MultiApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetch User and Posts')),
      body: BlocConsumer<MultiApiBloc, MultiApiState>(
        listener: (context, state) {
          if (state is MultiApiError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          if (state is MultiApiLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MultiApiLoaded) {
            return Column(
              children: [
                Text('User: ${state.user.name}'),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('Press the button to load data'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MultiApiBloc>().add(FetchUserAndPosts(1)); // Fetch user with ID 1 and posts
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
