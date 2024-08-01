import 'package:equatable/equatable.dart';


abstract class MultiApiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserAndPosts extends MultiApiEvent {
  final int userId;

  FetchUserAndPosts(this.userId);

  @override
  List<Object?> get props => [userId];
}