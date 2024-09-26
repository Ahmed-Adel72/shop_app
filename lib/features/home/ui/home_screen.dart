import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home/logic/home_cubit.dart';
import 'package:shop_app/features/home/logic/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        context.read<HomeCubit>().initialize();
        return const Scaffold(
          body: Center(
            child: Text("home screen"),
          ),
        );
      },
    );
  }
}
