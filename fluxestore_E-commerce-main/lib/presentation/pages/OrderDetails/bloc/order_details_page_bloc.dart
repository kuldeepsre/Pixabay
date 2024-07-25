import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/enums/delivarystatus.enum.dart';
import 'package:fluxestore/repository/OrdersRepo/orders_repository.dart';
import 'package:meta/meta.dart';

part 'order_details_page_event.dart';
part 'order_details_page_state.dart';

class OrderDetailsPageBloc
    extends Bloc<OrderDetailsPageEvent, OrderDetailsPageState> {
  OrderDetailsPageBloc() : super(OrderDetailsPageInitial()) {
    on<OrderDetailsPageInitialEvent>(_orderDetailsPageInitialEvent);
    on<CancelOrderEvent>(cancelOrderEvent);
    on<ConfirmCancellationEvent>(confirmCancellationEvent);
  }

  FutureOr<void> _orderDetailsPageInitialEvent(
      OrderDetailsPageInitialEvent event, Emitter<OrderDetailsPageState> emit) {
    switch (event.status) {
      case DeliveryStatus.pending:
        emit(PendingOrdersDetailsState());
      case DeliveryStatus.delivered:
        emit(DeliveredOrdersDetailsState());
      case DeliveryStatus.cancelled:
        emit(CancelledOrdersDetailsState());
        break;
      default:
    }
  }

  FutureOr<void> cancelOrderEvent(
      CancelOrderEvent event, Emitter<OrderDetailsPageState> emit) {
    emit(ShowConfirmationDialogActionState(
        orderId: event.orderId, userId: event.userId));
  }

  FutureOr<void> confirmCancellationEvent(ConfirmCancellationEvent event,
      Emitter<OrderDetailsPageState> emit) async {
    emit(ShowLoadingActionState(isLoading: true));
     await Future.delayed( const Duration(seconds: 3));
    var results =
        await OrdersRepository().cancelUserOrders(event.userId, event.orderId);
    if (results['status']) {
      emit(ShowLoadingActionState(isLoading: false));
      emit(CancellationSuccessActionState(message: results['message']));
    }
  }
}
