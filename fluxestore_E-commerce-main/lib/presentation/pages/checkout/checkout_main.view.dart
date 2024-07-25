import 'package:flutter/material.dart';
import 'package:fluxestore/models/delivery_address_model.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/pages/checkout/PaymentSection.view.dart';
import 'package:fluxestore/presentation/pages/checkout/ShippingAddressSection.view.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';
import '../../../utils/dialogs/loading_dialog.dart';
import 'bloc/check_out_page_bloc.dart';
import 'widgets/checkout_status_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPage extends StatefulWidget {
  final MyOrdersDataModel myOrdersData;
  const CheckOutPage({super.key, required this.myOrdersData});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late final CheckOutPageBloc checkOutPageBloc;

  CloseDialog? _closeDialogHandler;
  @override
  void initState() {
    super.initState();
    checkOutPageBloc = CheckOutPageBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkOutPageBloc.add(CheckOutInitialEvent());
    });
  }

  @override
  void dispose() {
    checkOutPageBloc.close();
    super.dispose();
  }

  bool agreedToTermsAndConditions = false;

  onChanged(bool? value) {
    setState(() {
      agreedToTermsAndConditions = !agreedToTermsAndConditions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: BlocConsumer<CheckOutPageBloc, CheckOutPageState>(
        listenWhen: (previous, current) => current is CheckOutPageActionState,
        buildWhen: (previous, current) => current is! CheckOutPageActionState,
        bloc: checkOutPageBloc,
        listener: (context, state) {
          switch (state.runtimeType) {
            case NavigateTohomePageActionState:
              Navigator.of(context)
                  .pushReplacementNamed('/');
            case PageLoadingDialogActionState:
              final currentState = state as PageLoadingDialogActionState;
              final closeDialog = _closeDialogHandler;
              if (!currentState.isLoading && closeDialog != null) {
                closeDialog();
                _closeDialogHandler = null;
              } else if (currentState.isLoading && closeDialog == null) {
                _closeDialogHandler = showLoadingDialog(context: context);
              }
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PageLoadingState:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black87,
                ),
              );
            case CheckOutPageBlocInitialState:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ChekoutStatusItemsView(
                    initState: true,
                    shippingAddressState: false,
                    paymentState: false,
                    completedState: false,
                  ),
                  ShippingAddressSection(
                    onPressed: (DeliveryAddress deliveryAddress) {
                      if (formKey.currentState!.validate()) {
                        checkOutPageBloc.add(CheckOutPagePaymentEvent(
                            subTotal: widget.myOrdersData.subTotal!,
                            addressData: deliveryAddress));
                      }
                    },
                  )
                ],
              );
            case PaymentPageState:
              final successData = state as PaymentPageState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ChekoutStatusItemsView(
                    initState: true,
                    shippingAddressState: true,
                    paymentState: true,
                    completedState: false,
                  ),
                  PaymentSectionView(
                    subTotal: successData.subTotal,
                    onChanged: (agreedToTermsAndConditions) {
                      onChanged(agreedToTermsAndConditions);
                    },
                    agreedToTermsAndConditions: agreedToTermsAndConditions,
                    onProceedToCheckOut: (paymentMethod) {
                      if (agreedToTermsAndConditions) {
                        checkOutPageBloc.add(CheckOutPagePlaceOrderEvent(
                            dataModel: widget.myOrdersData,
                            addressData: successData.address,
                            paymentMode: paymentMethod));
                      } else {
                        toastification.show(
                            context: context,
                            title: const Text(
                                "Please verify terms and conditions to proceed!"),
                            type: ToastificationType.error,
                            backgroundColor: const Color(0xFFFF8080),
                            style: ToastificationStyle.fillColored,
                            animationDuration:
                                const Duration(milliseconds: 600),
                            autoCloseDuration:
                                const Duration(milliseconds: 4000),
                            showProgressBar: false,
                            alignment: Alignment.bottomCenter);
                      }
                    },
                  )
                ],
              );
            case PaymentCompletedState:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ChekoutStatusItemsView(
                    initState: true,
                    shippingAddressState: true,
                    paymentState: true,
                    completedState: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Order Completed",
                            style: TextStyle(
                                color: Color(0xff1D1F22),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Lottie.asset(
                              "assets/lottie/completed_lottie.json",
                              width: 200,
                              height: 200,
                              repeat: false),
                        ),
                        const Center(
                          child: SizedBox(
                            height: 75,
                            width: 272,
                            child: Text(
                                "Thank you for your purchase!, You can view your order in ‘My Orders’ section.",
                                style: TextStyle(
                                    color: Color(0xff1D1F22),
                                    fontSize: 14,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                checkOutPageBloc
                                    .add(NavigateBackToHomePageEvent());
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF343434))),
                              child: const Text(
                                "Continue shopping",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
