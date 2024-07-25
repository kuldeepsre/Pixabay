import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/model/DashboardModel.dart';
import '../../../domain/controller/dashboard_controller.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';
@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  IDashboardController controller;
  DashboardBloc(this.controller) : super(DashboardInitial());
  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is DashboardFetchEvent){
        yield DashboardFetchingState();
        final response = await controller.getDashboard();
            if (response.ok) {
               yield DashboardFetchingSuccessState(response.response);
               return;
              }
        yield DashboardFetchingFailureState(response.message);
    }
    else if (event is DashboardPostEvent){
         yield DashboardPostingState();
           final response = await controller.getDashboard();
             if (response.ok) {
                yield DashboardPostingSuccessState(response.response);
                    return;
             }
         yield DashboardPostingFailureState(response.message);
    }
  }
}
