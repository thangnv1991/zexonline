import 'package:get/get.dart';
import 'package:zexonline/src/ui/payment/interactor/payment_bloc.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<PaymentBloc>(PaymentBloc());
  }
}
