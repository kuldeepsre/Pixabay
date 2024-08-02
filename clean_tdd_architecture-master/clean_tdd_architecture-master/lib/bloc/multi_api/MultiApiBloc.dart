import 'package:bloc/bloc.dart';
import 'package:clean_tdd_architecture/bloc/multi_api/MultiApiState.dart';

import '../../UserRepository.dart';
import 'MultiApiEvent.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostState> {
  final Repository repository;

  UserPostBloc(this.repository) : super(UserPostInitial()) {
    on<FetchUserAndPosts>(_onFetchUserAndPosts);
  }

  Future<void> _onFetchUserAndPosts(FetchUserAndPosts event, Emitter<UserPostState> emit) async {
    emit(UserPostLoading());
    try {
      final usersFuture = repository.getUsers();
      final postsFuture = repository.getPosts();
      final users = await usersFuture;
      final posts = await postsFuture;

      emit(UserPostLoaded(users, posts));
    } catch (e) {
      emit(UserPostError(e.toString()));
    }
  }
}