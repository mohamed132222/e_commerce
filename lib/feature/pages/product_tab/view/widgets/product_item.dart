import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_asset.dart';
import '../../../../../core/utils/app_color.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const ProductItem({
    super.key,
    required this.product,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColor.primaryColor, width: 1.5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 130.h,
                  imageUrl: widget.product.imageCover ?? "",
                  fit: BoxFit.cover,

                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: const CircularProgressIndicator(
                        color: AppColor.primaryColor,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, size: 20.sp, color: AppColor.redColor),
                ),
              ),

              Positioned(
                right: 4.w,
                top: 4.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                    widget.onFavoritePressed?.call();
                  },
                  icon: SizedBox(
                    width: 50.w,
                    height: 50.w,
                    child: isFav
                        ? Image.asset(AppAsset.add_favorite_selected)
                        : Image.asset(AppAsset.add_favorite_unselected),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Text(
                      widget.product.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: AppColor.primaryDarkColor,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        Text(
                          "EGP ${widget.product.price}",
                          style: TextStyle(
                            color: AppColor.primaryDarkColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Flexible(
                          child: Text(
                            "${widget.product.price! * 2}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: AppColor.primaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      children: [
                        Text(
                          "Review (${widget.product.ratingsAverage})",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.primaryDarkColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 6.w),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            CartViewModel.get(
                              context,
                            ).addProductToCart(widget.product.id ?? "");
                          },
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
