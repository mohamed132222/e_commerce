import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/domain/entities/response/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 40;
  int quantity = 1;
  int selectedColorIndex = 1;

  final List<int> sizes = [38, 39, 40, 41, 42];
  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(
            color: AppColor.primaryDarkColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.black, size: 22.sp),
          SizedBox(width: 10.w),
          Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 22.sp),
          SizedBox(width: 10.w),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 300.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: ImageSlideshow(
                            width: double.infinity,
                            height: 250.h,
                            indicatorColor: Colors.blue,
                            indicatorBackgroundColor: Colors.grey,
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: args.images!
                                .map(
                                  (image) =>
                                      Image.network(image, fit: BoxFit.cover),
                                )
                                .toList(),
                          ),
                        ),
                      ),

                      Positioned(
                        right: 15.w,
                        top: 15.h,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.blue,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          args.title ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryDarkColor,
                          ),
                        ),
                      ),
                      Text(
                        "EGP ${args.price ?? ""}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryDarkColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      _tag("${args.sold} Sold"),
                      SizedBox(width: 10.w),
                      Icon(Icons.star, color: Colors.amber, size: 19.sp),
                      Text(
                        " ${args.ratingsAverage} (7,500)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryDarkColor,
                        ),
                      ),
                      const Spacer(),
                      _quantityWidget(),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryDarkColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  ReadMoreText(
                    args.description ?? "",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Read More",
                    trimExpandedText: " Show Less",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16.sp,
                    ),
                    moreStyle: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    lessStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 30.h),
            child: Container(
              padding: EdgeInsets.all(14.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total price",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "EGP ${args.price! * quantity}",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor,
                        ),
                      ),
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

  Widget _tag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade400, width: 1.5.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryDarkColor,
        ),
      ),
    );
  }

  Widget _quantityWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (quantity > 1) {
                setState(() => quantity--);
              }
            },
            icon: Icon(Icons.remove, color: Colors.white, size: 18.sp),
          ),
          Text(
            "$quantity",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => quantity++);
            },
            icon: Icon(Icons.add, color: Colors.white, size: 18.sp),
          ),
        ],
      ),
    );
  }
}
