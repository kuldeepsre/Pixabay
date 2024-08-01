import 'package:equatable/equatable.dart';
import '../../model/post.dart';
import '../../model/user.dart';


abstract class MultiApiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MultiApiInitial extends MultiApiState {}

class MultiApiLoading extends MultiApiState {}

class MultiApiLoaded extends MultiApiState {
  final User user;
  final List<Post> posts;

  MultiApiLoaded(this.user, this.posts);

  @override
  List<Object?> get props => [user, posts];
}

class MultiApiError extends MultiApiState {
  final String message;

  MultiApiError(this.message);

  @override
  List<Object?> get props => [message];
}
