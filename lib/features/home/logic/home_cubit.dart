import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/networking/api_results.dart';
import 'package:shop_app/features/favourites/constants/favourites_constants.dart';
import 'package:shop_app/features/home/data/models/add_favourite_request_body.dart';
import 'package:shop_app/features/home/data/models/add_favourite_response_body.dart';
import 'package:shop_app/features/home/data/models/home_response_model.dart';
import 'package:shop_app/features/home/data/repos/home_repo.dart';
import 'package:shop_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  void getHomeData() async {
    emit(HomeDataLoadingState());
    final response = await _homeRepo.getHomeDate();
    if (response is Success<HomeResponseModel>) {
      emit(HomeDataSuccessState(response.data));
      response.data.data!.products!.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
    } else if (response is Failure<HomeResponseModel>) {
      emit(HomeDataErrorState(response.apiErrorModel));
    }
  }

  Future addAndRemoveFavorite({int? productId}) async {
    final response = await _homeRepo
        .addAndRemoveFavorite(AddFavouriteRequestBody(productId: productId!));
    if (response is Success<AddFavoriteResponseBody>) {
      print("added favorite success");
    } else if (response is Failure<AddFavoriteResponseBody>) {
      print(response.apiErrorModel.message);
    }
    return response;
  }
}
