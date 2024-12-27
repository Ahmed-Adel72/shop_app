import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/favourites/logic/favourite_cubit.dart';

class SetupErrorFavorites extends StatelessWidget {
  final String error;
  const SetupErrorFavorites({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: Colors.red,
          ),
          SizedBox(height: 16.h),
          Text(
            'Oops! Something went wrong',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              error,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () {
              context.read<FavouriteCubit>().getFavorites();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
