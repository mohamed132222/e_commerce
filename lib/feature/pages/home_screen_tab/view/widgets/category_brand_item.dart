import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/domain/entities/response/common/category_or_brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  final CategoryOrBrand item;

  CategoryBrandItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            width: double.infinity,
            height: 10.h,
            imageUrl: item.image ?? "",
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(backgroundImage: imageProvider);
            },
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColor.primaryColor),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: AppColor.redColor),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 4,
          child: Text(
            item.name ?? "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.primaryDarkColor,
            ),
          ),
        ),
      ],
    );
  }
}
