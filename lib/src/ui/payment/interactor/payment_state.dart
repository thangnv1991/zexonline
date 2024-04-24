part of 'payment_bloc.dart';

class PaymentState extends Equatable {

  final PageState status;
  final String error;

  const PaymentState({
    required this.status,
    required this.error,
  });

  PaymentState copyWith({
    PageState? status,
    String? error,
  }) {
    return PaymentState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }


  @override
  List<Object?> get props => [];
}