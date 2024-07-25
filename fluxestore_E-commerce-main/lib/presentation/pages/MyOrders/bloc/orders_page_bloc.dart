import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/repository/OrdersRepo/orders_repository.dart';
import 'package:meta/meta.dart';

part 'orders_page_event.dart';
part 'orders_page_state.dart';

class MyOrdersPageBloc extends Bloc<OrdersPageEvent, MyOrdersPageState> {
  MyOrdersPageBloc() : super(OrdersPageInitial()) {
    on<OrdersPageInitialEvent>(ordersPageInitialEvent);
  }
  FutureOr<void> ordersPageInitialEvent(
      OrdersPageInitialEvent event, Emitter<MyOrdersPageState> emit) async {
    emit(OrdersPageLoadingState());
    var results = await OrdersRepository().getUserOrders(event.userId);
    if (results['status']) {
      var data = results['data'];
      //map all the orders into ordersdatamodel and keeping it in a temp list
      List<MyOrdersDataModel> tempList = [];
      for (var i = 0; i < data.length; i++) {
        data[i]['shippingCharges'] = double.parse(data[i]['shippingCharges']);
        MyOrdersDataModel items = MyOrdersDataModel.fromJson(data[i]);
        tempList.add(items);
      }
      List<MyOrdersDataModel> pendingList = [];
      List<MyOrdersDataModel> deliveredList = [];
      List<MyOrdersDataModel> cancelledList = [];
      //add orders to different list based on delivery status
      for (var i = 0; i < tempList.length; i++) {
        String status = tempList[i].deliveryStatus!;
        switch (status) {
          case "PENDING" || "INTRANSIT":
            pendingList.add(tempList[i]);
          case "DELIVERED":
            deliveredList.add(tempList[i]);
          case "CANCELLED":
            cancelledList.add(tempList[i]);
          default:
        }
      }
      emit(OrdersPageSuccessState(
          pendingOrders: pendingList,
          deliveredOrders: deliveredList,
          cancelledOrders: cancelledList));
    }
  }
}
