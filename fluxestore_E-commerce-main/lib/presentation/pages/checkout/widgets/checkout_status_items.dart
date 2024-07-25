import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ChekoutStatusItemsView extends StatelessWidget {
  final bool shippingAddressState;
  final bool paymentState;
  final bool completedState;
  final bool initState;
  const ChekoutStatusItemsView({
    super.key, 
    required this.shippingAddressState, 
    required this.paymentState, 
    required this.completedState, required this.initState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/location.svg",
            colorFilter:
                 ColorFilter.mode(initState? const Color(0xff22242A):const Color(0xffC8C7CC), BlendMode.srcIn),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: StepProgressIndicator(
              currentStep: 5,
              totalSteps: 5,
              padding: 7,
              roundedEdges: const Radius.circular(20),
              selectedColor: initState && shippingAddressState? const Color(0xff22242A):const Color(0xffC8C7CC),
              
            ),
          ),
          SvgPicture.asset(
            "assets/images/card.svg",
            colorFilter:
                 ColorFilter.mode(paymentState? const Color(0xff22242A):const Color(0xffC8C7CC), BlendMode.srcIn),
          ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: StepProgressIndicator(
              currentStep: 5,
              totalSteps: 5,
              padding: 7,
              roundedEdges: const Radius.circular(20),
              blendMode:  BlendMode.srcIn,
              selectedColor:
                // Color(0xff22242A) ,
                completedState && paymentState? const Color(0xff22242A):const Color(0xffC8C7CC),
            ),
          ),
          SvgPicture.asset(
            "assets/images/check.svg",
            colorFilter:
                 ColorFilter.mode(completedState? const Color(0xff22242A):const Color(0xffC8C7CC), BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
