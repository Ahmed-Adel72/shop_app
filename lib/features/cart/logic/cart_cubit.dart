import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/logic/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  void getName() {
    print("cart");
  }
}
