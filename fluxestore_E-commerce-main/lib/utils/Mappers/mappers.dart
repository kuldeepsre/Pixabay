import 'package:fluxestore/constants/constants.dart';

import '../../models/cart_items_model.dart';
import '../../models/delivery_address_model.dart';
import '../../models/my_orders_data_model.dart';
import '../../models/product_data_model.dart';

class Mappers {
  CartItemsModel mapProductsFromProductDataModel(
      ProductDataModel data, int colorIndex, int sizeIndex) {
    return CartItemsModel(
        userId: email,
        productId: data.id.toString(),
        productName: data.productName,
        price: data.price,
        imageUrl: data.imageUrl,
        color: data.colors![colorIndex],
        size: data.sizes![sizeIndex].toString(),
        quantity: 1,
        selected: true);
  }

  MyOrdersDataModel myOrdersDataMapper(
      List<CartItemsModel> cartItems, double subTotal, String userId) {
    List<CartItemsModel> selectedItems = [];
    int totalQuantity = 0;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected!) {
        selectedItems.add(cartItems[i]);
      }
    }
    for (var i = 0; i < selectedItems.length; i++) {
      totalQuantity += selectedItems[i].quantity!;
    }
    var tempSubTotal = subTotal.toStringAsFixed(2);
    double convertedSubTotal = double.parse(tempSubTotal);
    return MyOrdersDataModel(
        date: DateTime.now().toString(),
        deliveryAddress: DeliveryAddress(),
        deliveryStatus: "PENDING",
        userId: userId,
        orderID: "",
        orderedItems: selectedItems,
        quantity: totalQuantity,
        shippingCharges: 0.00,
        subTotal: convertedSubTotal,
        total: convertedSubTotal,
        trackingNumber: "IK987362341");
  }
}
