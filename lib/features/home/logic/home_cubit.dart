import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  void initialize() {
    // Perform any initial operations here
    print("HomeCubit initialized"); // Example print
  }
}
