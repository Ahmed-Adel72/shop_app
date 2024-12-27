import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/favourites/data/models/delete_favorite_date.dart';
import 'package:shop_app/features/favourites/data/models/favorites_response.dart';
import 'package:shop_app/features/favourites/data/repos/favorites_repo.dart';
import 'package:shop_app/features/favourites/logic/favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavoritesRepo _favoritesRepo;
  FavouriteCubit(this._favoritesRepo) : super(FavouriteInitialState());

  void getFavorites() async {
    emit(FavoritesLoadingState());
    final response = await _favoritesRepo.getFavorites();
    if (response is Success<FavoritesResponse>) {
      emit(FavoritesSuccessState(response.data));
    } else if (response is Failure<FavoritesResponse>) {
      emit(FavoritesErrorState(response.apiErrorModel));
    }
  }

  void deleteFavorite({required int id}) async {
    emit(FavoritesLoadingState());
    final response = await _favoritesRepo.deleteFavorite(id: id);
    if (response is Success<DeleteFavoriteResponse>) {
      getFavorites();
    } else if (response is Failure<DeleteFavoriteResponse>) {
      emit(FavoritesErrorState(response.apiErrorModel));
    }
  }
}
