import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../api_services.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

// BLoC
class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  final ApiService apiService;
  int _currentPage = 1;
  int _totalPages = 1;
  List<Map<String, dynamic>> _data = [];

  PaginationBloc(this.apiService) : super(PaginationInitial()) {
    on<FetchData>(_onFetchData);
    on<FetchNextPage>(_onFetchNextPage);
    on<FetchPreviousPage>(_onFetchPreviousPage);
  }

  Future<void> _onFetchData(FetchData event, Emitter<PaginationState> emit) async {
    if (event.page < 1 || event.page > _totalPages) return;

    emit(PaginationLoading());

    try {
      final response = await apiService.fetchData(event.page);
      final newData = List<Map<String, dynamic>>.from(response['data']);
      _currentPage = response['page'];
      _totalPages = response['total_pages'];

      // Update the data list based on the current page
      if (event.page == 1) {
        _data = newData;
      } else {
        _data.addAll(newData);
      }

      emit(PaginationLoaded(_data, _currentPage, _totalPages));
    } catch (e) {
      emit(PaginationError(e.toString()));
    }
  }

  void _onFetchNextPage(FetchNextPage event, Emitter<PaginationState> emit) {
    if (_currentPage < _totalPages) {
      add(FetchData(_currentPage + 1));
    }
  }

  void _onFetchPreviousPage(FetchPreviousPage event, Emitter<PaginationState> emit) {
    if (_currentPage > 1) {
      add(FetchData(_currentPage - 1));
    }
  }
}
