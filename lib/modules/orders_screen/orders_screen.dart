import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_cubit.dart';
import 'package:taajer/modules/orders_screen/orders_cubit/orders_states.dart';
import 'package:taajer/shared/components/orders_screen/my_orders_item.dart';

class OrdersScreen extends StatelessWidget {
  bool delivered = true;
  bool cancelled = false;
  bool requested = false;
  OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersCubit cubit = OrdersCubit.get(context);
    return BlocBuilder<OrdersCubit, OrdersStates>(
      builder: (BuildContext context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                width: 342.w,
                height: 43.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE2E4E8),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          delivered = true;
                          cancelled = false;
                          requested = false;
                          cubit.emit(OrdersStatesRefreshState());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: delivered
                                ? Colors.white
                                : const Color(0xFFE2E4E8),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              'Delivered',
                              style: TextStyle(
                                color: const Color(0xFF525C76),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          delivered = false;
                          cancelled = true;
                          requested = false;
                          cubit.emit(OrdersStatesRefreshState());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: cancelled
                                ? Colors.white
                                : const Color(0xFFE2E4E8),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              'Cancelled',
                              style: TextStyle(
                                color: const Color(0xFF525C76),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          delivered = false;
                          cancelled = false;
                          requested = true;
                          cubit.emit(OrdersStatesRefreshState());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: requested
                                ? Colors.white
                                : const Color(0xFFE2E4E8),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Text(
                              'Requested',
                              style: TextStyle(
                                color: const Color(0xFF525C76),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              MyOrdersBuilderItem(),
            ],
          ),
        ),
      ),
    );
  }
}
