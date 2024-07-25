import 'package:fluxestore/models/delivery_address_model.dart';

class UserModel {
  String? userName;
  String? email;
  String? hashedPassword;
  List<DeliveryAddress>? address;

  UserModel({this.userName, this.email, this.hashedPassword, this.address});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    hashedPassword = json['hashedPassword'];
    if (json['address'] != null) {
      address = <DeliveryAddress>[];
      json['address'].forEach((v) {
        address!.add(DeliveryAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['hashedPassword'] = hashedPassword;
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}