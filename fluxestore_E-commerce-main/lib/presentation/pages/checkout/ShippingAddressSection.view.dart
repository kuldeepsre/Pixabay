import 'package:flutter/material.dart';
import 'package:fluxestore/models/delivery_address_model.dart';
import 'bloc/check_out_page_bloc.dart';
import 'widgets/country_picker.dart';

class ShippingAddressSection extends StatefulWidget {
  final Function(DeliveryAddress)? onPressed;
  const ShippingAddressSection({
    super.key,
    required this.onPressed,
  });

  @override
  State<ShippingAddressSection> createState() => _ShippingAddressSectionState();
}

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController streetNameController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateProvinceController = TextEditingController();
TextEditingController stateNameController = TextEditingController();
TextEditingController zipCode = TextEditingController();
TextEditingController phoneNumber = TextEditingController();
TextEditingController cuponCodeController = TextEditingController();

String selectedCountry = '';
String selectedCity = '';
String selectedState = '';

final formKey = GlobalKey<FormState>();

int selectedRadio = 1;
bool saveAddress = false;

DeliveryAddress addressMapper() {
  return DeliveryAddress(
      city: selectedCity,
      country: selectedCountry,
      state: selectedState,
      street: streetNameController.text,
      phoneNumber: phoneNumber.text,
      postalCode: zipCode.text);
}

class _ShippingAddressSectionState extends State<ShippingAddressSection> {
  selectedRadioFunc(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void dispose() {
    clearControllers();
    super.dispose();
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    streetNameController.clear();
    cityController.clear();
    stateProvinceController.clear();
    stateNameController.clear();
    zipCode.clear();
    phoneNumber.clear();
    cuponCodeController.clear();
  }

  final CheckOutPageBloc checkOutPageBloc = CheckOutPageBloc();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("STEP 1",
                  style: TextStyle(
                      color: Color(0xff1D1F22),
                      fontSize: 11,
                      fontWeight: FontWeight.w400)),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text("Shipping",
                    style: TextStyle(
                        color: Color(0xff1D1F22),
                        fontSize: 25,
                        fontWeight: FontWeight.w700)),
              ),

              const SizedBox(
                height: 20,
              ),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    //* First name
                    TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        hintText: "First name *",
                        focusColor: Colors.black,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff777E90))),
                        hintStyle: TextStyle(
                          color: Color(0xff777E90),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixText: "*", // Asterisk as suffix text
                        suffixStyle: TextStyle(
                            color: Colors.red), // Color of the asterisk
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This filed is required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //* Last name
                    TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          hintText: "Last name *",
                          focusColor: Colors.black,
                          hintStyle: TextStyle(
                            color: Color(0xff777E90),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixText: "*",
                          suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This filed is required";
                          } else {
                            return null;
                          }
                        }),

                    const SizedBox(
                      height: 25,
                    ),
                    //* Street name
                    TextFormField(
                        controller: streetNameController,
                        decoration: const InputDecoration(
                          hintText: "Street name *",
                          focusColor: Colors.black,
                          hintStyle: TextStyle(
                            color: Color(0xff777E90),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixText: "*",
                          suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This filed is required";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 0,
                    ),

                    CountryPicker(
                      scountry: (country) => selectedCountry = country,
                      scity: (city) => selectedCity = city,
                      sstate: (state) => selectedState = state,
                    ),
                    //*Zip code
                    TextFormField(
                        controller: zipCode,
                        decoration: const InputDecoration(
                          hintText: "Zip code *",
                          focusColor: Colors.black,
                          hintStyle: TextStyle(
                            color: Color(0xff777E90),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixText: "*",
                          suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return "This filed is required";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    //*Phone number
                    TextFormField(
                        controller: phoneNumber,
                        decoration: const InputDecoration(
                          hintText: "Phone number",
                          focusColor: Colors.black,
                          hintStyle: TextStyle(
                            color: Color(0xff777E90),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixText: "*",
                          suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            return "This filed is required";
                          } else {
                            return null;
                          }
                        }),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              //* shipping methohd section------------------------------>
              const Text("Shipping method",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Divider(color: Color(0xFFF1F2F3)),
                    RadioListTile(
                      activeColor: const Color(0xff508A7B),
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        selectedRadioFunc(val);
                      },
                      title: const Row(
                        children: [
                          Text("Free",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Delivery to home",
                              style: TextStyle(
                                  color: Color(0xff737680),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      subtitle: const Text("Delivery from 3 to 7 business days",
                          style: TextStyle(
                              color: Color(0xffA3A5AD),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    const Divider(color: Color(0xFFF1F2F3)),
                    RadioListTile(
                      activeColor: const Color(0xff508A7B),
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        selectedRadioFunc(val);
                      },
                      title: const Row(
                        children: [
                          Text("\$9.99",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Delivery to home",
                              style: TextStyle(
                                  color: Color(0xff737680),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      subtitle: const Text("Delivery from 4 to 6 business days",
                          style: TextStyle(
                              color: Color(0xffA3A5AD),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    const Divider(color: Color(0xFFF1F2F3)),
                    RadioListTile(
                      activeColor: const Color(0xff508A7B),
                      value: 3,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        selectedRadioFunc(val);
                      },
                      title: const Row(
                        children: [
                          Text("\$9.90",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Fast Delivary",
                              style: TextStyle(
                                  color: Color(0xff737680),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      subtitle: const Text("Delivery from 2 to 3 business days",
                          style: TextStyle(
                              color: Color(0xffA3A5AD),
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("Coupon Code",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.maxFinite,
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F7F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextField(
                            controller: cuponCodeController,
                            decoration: const InputDecoration(
                              hintText: "Have a code? type it here...",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Color(0xFFCBCDD8)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Validate",
                            style: TextStyle(
                                color: Color(0xff508A7B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("Billing Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                      activeColor: const Color(0xff508A7B),
                      value: saveAddress,
                      onChanged: (value) {
                        setState(() {
                          saveAddress = !saveAddress;
                        });
                      }),
                  const Text("Copy address data from shipping",
                      style: TextStyle(
                          color: Color(0xff575757),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      widget.onPressed!(addressMapper());
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFF343434))),
                    child: const Text(
                      "Continue to payment",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
