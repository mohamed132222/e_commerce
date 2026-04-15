import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_state.dart';
import 'package:e_commerce/feature/pages/cart_tab/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? controller;
  final VoidCallback? onCartPressed;
  final ValueChanged<String>? onChanged;
  final int? count;

  SearchAppBar({
    this.count,
    super.key,
    this.controller,
    this.onCartPressed,
    this.onChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var viewModel = CartViewModel.get(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          // 🔍 Search Field
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: AppColor.primaryColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  filled: true,
                  fillColor: Colors.transparent,

                  border: _buildBorder(),
                  enabledBorder: _buildBorder(),
                  focusedBorder: _buildBorder(),
                  errorBorder: _buildBorder(),
                  focusedErrorBorder: _buildBorder(),
                  disabledBorder: _buildBorder(),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // 🛒 Cart Button
          BlocBuilder<CartViewModel, CartState>(
            bloc: viewModel,
            builder: (context, state) {
              return Badge(
                backgroundColor: AppColor.greenColor,

                alignment: Alignment.topCenter,
                label: Text(viewModel.numOfCartItem.toString()),
                isLabelVisible: true,
                textColor: AppColor.whiteColor,
                child: IconButton(
                  onPressed: onCartPressed,
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: AppColor.primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
    );
  }
}
