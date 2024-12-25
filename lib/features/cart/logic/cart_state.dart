abstract class CartState {}

class CartInitialState extends CartState {}

class PaymentLoadingState extends CartState {}

class PaymentSuccessState extends CartState {}

class PaymentErrorState extends CartState {
  final String error;

  PaymentErrorState({required this.error});
}
