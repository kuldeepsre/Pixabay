import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../api_services.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final ApiService apiService;
  int _currentPage = 0;
  int _totalPages = 1;

  PaginationBloc(this.apiService) : super(PaginationInitial());

  @override
  Stream<PaginationState> mapEventToState(PaginationEvent event) async* {
    if (event is FetchData) {
      if (_currentPage == event.page && _currentPage >= _totalPages) return;

      yield PaginationLoading();

      try {
        final response = await apiService.fetchData(event.page);
        final newData = List<Map<String, dynamic>>.from(response['data']);
        _currentPage = response['page'];
        _totalPages = response['total_pages'];

        final currentState = state;
        if (currentState is PaginationLoaded) {
          yield PaginationLoaded([...currentState.data, ...newData], _currentPage, _totalPages);
        } else {
          yield PaginationLoaded(newData, _currentPage, _totalPages);
        }
      } catch (e) {
        yield PaginationError(e.toString());
      }
    }
  }
}
