import 'package:equatable/equatable.dart';
import '../../model/post.dart';
import '../../model/user.dart';


abstract class UserPostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserPostInitial extends UserPostState {}

class UserPostLoading extends UserPostState {}

class UserPostLoaded extends UserPostState {
  final List<User> users;
  final List<Post> posts;

  UserPostLoaded(this.users, this.posts);

  @override
  List<Object?> get props => [users, posts];
}

class UserPostError extends UserPostState {
  final String message;

  UserPostError(this.message);

  @override
  List<Object?> get props => [message];
}