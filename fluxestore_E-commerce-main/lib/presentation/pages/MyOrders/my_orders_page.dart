import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/presentation/pages/MyOrders/bloc/orders_page_bloc.dart';
import 'package:fluxestore/presentation/pages/MyOrders/widgets/my_orders_list.dart';
import '../../reuseables/my_orders_catagory_card.dart';
import 'widgets/orders_page_shimmer_loaders.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});
  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

int tabIndex = 0;
final MyOrdersPageBloc myOrdersPagebloc = MyOrdersPageBloc();

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    myOrdersPagebloc.add(OrdersPageInitialEvent(userId: email));
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    categoryList[0].isSelected = true;
    categoryList[1].isSelected = false;
    categoryList[2].isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersPageBloc, MyOrdersPageState>(
      bloc: myOrdersPagebloc,
      listenWhen: (previous, current) => current is OrdersPageActionState,
      buildWhen: (previous, current) => current is! OrdersPageActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case OrdersPageLoadingState:
            return const OrdersPageShimmerLoader();
          case OrdersPageSuccessState:
            final successState = state as OrdersPageSuccessState;
            List<Widget> myOrderStatusContainer = [
              OrdersList(items: successState.pendingOrders),
              OrdersList(items: successState.deliveredOrders),
              OrdersList(items: successState.cancelledOrders),
            ];

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("My Orders",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 4,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                          decelerationRate: ScrollDecelerationRate.normal,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            category: categoryList[index],
                            onPressed: (b) {
                              for (var category in categoryList) {
                                category.isSelected = false;
                              }
                              setState(() {
                                categoryList[index].isSelected = true;
                                tabIndex = index;
                              });
                              _tabController.animateTo(
                                tabIndex,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          myOrderStatusContainer[0],
                          myOrderStatusContainer[1],
                          myOrderStatusContainer[2],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
