import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/favourites/logic/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitialState());

  void getName() {
    print("ahmed adel");
  }
}
