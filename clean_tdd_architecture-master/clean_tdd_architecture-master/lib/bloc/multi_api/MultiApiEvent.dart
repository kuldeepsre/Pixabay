import 'package:equatable/equatable.dart';


abstract class UserPostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserAndPosts extends UserPostEvent {}