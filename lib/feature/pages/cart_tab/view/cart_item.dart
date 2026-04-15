import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_asset.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/domain/entities/response/cart/get/get_product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  final GetProductCart item;

  const CartItem({super.key, required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.blueGrey.shade100, width: 1.5.w),
      ),
      child: Row(
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child: CachedNetworkImage(
              height: 130.h,
              imageUrl: widget.item.imageCover ?? "",
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

          SizedBox(width: 10.w),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE + DELETE
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.title ?? "",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryDarkColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Image.asset(
                      AppAsset.delete_icon,
                      width: 20.w,
                      height: 20.h,
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),

                SizedBox(height: 4.h),

                /// COLOR + SIZE
                // Row(
                //   children: [
                //     CircleAvatar(radius: 5.r, backgroundColor: widget.color),
                //     SizedBox(width: 6.w),
                //     Text(
                //       "Orange | Size: ${widget.size}",
                //       style: TextStyle(
                //         fontSize: 13.sp,
                //         color: AppColor.primaryDarkColor,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 8.h),

                /// PRICE + COUNTER
                Row(
                  children: [
                    Text(
                      "EGP ${widget.item.price}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryDarkColor,
                      ),
                    ),
                    Spacer(),

                    /// COUNTER
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "${widget.item.quantity}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
