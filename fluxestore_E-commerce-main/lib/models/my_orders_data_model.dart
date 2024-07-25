import 'cart_items_model.dart';
import 'delivery_address_model.dart';

class MyOrdersDataModel {
  String? userId;
  String? orderID;
  String? trackingNumber;
  String? date;
  DeliveryAddress? deliveryAddress;
  int? quantity;
  List<CartItemsModel>? orderedItems;
  double? subTotal;
  double? shippingCharges;
  double? total;
  String? paymentMethod;
  String? deliveryStatus;

  MyOrdersDataModel(
      {this.userId,
      this.orderID,
      this.trackingNumber,
      this.date,
      this.deliveryAddress,
      this.quantity,
      this.orderedItems,
      this.subTotal,
      this.shippingCharges,
      this.total,
      this.paymentMethod,
      this.deliveryStatus});

  MyOrdersDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    orderID = json['orderID'];
    trackingNumber = json['trackingNumber'];
    date = json['date'];
    deliveryStatus = json['deliveryStatus'];
    quantity = json['quantity'];
    if (json['orderedItems'] != null) {
      orderedItems = <CartItemsModel>[];
      json['orderedItems'].forEach((v) {
        orderedItems!.add(CartItemsModel.fromJson(v));
      });
    }
    subTotal = json['subTotal'];
    shippingCharges = json['shippingCharges'];
    total = json['total'];
    paymentMethod = json['paymentMethod'];
    deliveryAddress = DeliveryAddress.fromJson(json['deliveryAddress']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderID'] = orderID;
    data['userId'] = userId;
    data['trackingNumber'] = trackingNumber;
    data['date'] = date;
    data['deliveryStatus'] = deliveryStatus;
    data['quantity'] = quantity;
    if (orderedItems != null) {
      data['orderedItems'] = orderedItems!.map((v) => v.toJson()).toList();
    }
    data['subTotal'] = subTotal;
    data['shippingCharges'] = shippingCharges;
    data['total'] = total;
    data['paymentMethod'] = paymentMethod;
    data['deliveryAddress'] = deliveryAddress?.toJson();
    return data;
  }
}

class OrderedItems {
  String? productID;
  int? quantity;
  double? price;

  OrderedItems({this.productID, this.quantity, this.price});

  OrderedItems.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productID'] = productID;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
