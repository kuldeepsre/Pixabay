import 'package:bloc/bloc.dart';
import 'package:clean_tdd_architecture/bloc/multi_api/MultiApiState.dart';

import '../../UserRepository.dart';
import 'MultiApiEvent.dart';

class MultiApiBloc extends Bloc<MultiApiEvent, MultiApiState> {
  final Repository repository;

  MultiApiBloc(this.repository) : super(MultiApiInitial());

  @override
  Stream<MultiApiState> mapEventToState(MultiApiEvent event) async* {
    if (event is FetchUserAndPosts) {
      yield MultiApiLoading();
      try {
        final user = await repository.getUser(event.userId);
        final posts = await repository.getPosts();
        yield MultiApiLoaded(user, posts);
      } catch (e) {
        yield MultiApiError(e.toString());
      }
    }
  }
}
