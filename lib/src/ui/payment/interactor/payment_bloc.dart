import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState>{
  PaymentBloc(
      ) : super(const PaymentState(error: '', status: PageState.loading));
}
