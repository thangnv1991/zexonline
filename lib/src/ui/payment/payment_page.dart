import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/payment/component/payment_view.dart';
import 'package:zexonline/src/ui/payment/interactor/payment_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<PaymentBloc>(),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const PaymentView();
        },
      ),
    );
  }
}
