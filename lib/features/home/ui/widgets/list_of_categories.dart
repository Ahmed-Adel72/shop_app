import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/features/home/data/models/categories_response_body.dart';

class ListOfCategories extends StatelessWidget {
  final CategoriesResponseBody categories;
  const ListOfCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 80.w,
                    child: Image.network(
                      "${categories.data!.dataBody![index].image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${categories.data!.dataBody![index].name}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 3.w,
              ),
          itemCount: categories.data!.dataBody!.length),
    );
  }
}
