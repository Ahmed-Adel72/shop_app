import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home/logic/home_cubit.dart';
import 'package:shop_app/features/home/logic/home_state.dart';
import 'package:shop_app/features/home/ui/widgets/setup_loading_home.dart';
import 'package:shop_app/features/home/ui/widgets/setup_success_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeDataLoadingState) {
          return const SetupLoadingHome();
        } else if (state is HomeAndCategoriesSuccessState) {
          return SetupSuccessHome(
            homeResponseModel: state.homeResponseModel,
            categoriesResponseBody: state.categoriesResponseBody,
          );
        } else if (state is HomeDataErrorState) {
          return Center(child: Text("Error: ${state.apiErrorModel.message}"));
        } else {
          return const SizedBox(); // Handle the initial state or any other case
        }
      },
    );
  }
}
