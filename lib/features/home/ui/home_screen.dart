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
        switch (state) {
          case HomeDataLoadingState _:
            return const SetupLoadingHome();
          case HomeDataSuccessState _:
            return SetupSuccessHome(
              homeResponseModel: state.homeResponseModel,
            );
          case HomeDataErrorState _:
            return const SizedBox();
          default:
            return const SizedBox();
        }
      },
    );
  }
}
