import 'package:flutter/material.dart';
import 'package:shopsmart_admin_ar/screens/edit_upload_product_form.dart';
import 'package:shopsmart_admin_ar/screens/search_screen.dart';
import 'package:shopsmart_admin_ar/services/assets_manager.dart';

class DashboardButtonModel {
  final String text;
  final String image;
  final void Function() onTap;

  DashboardButtonModel(
      {required this.text, required this.image, required this.onTap});
  static List<DashboardButtonModel> dashboardButtonsList(
          BuildContext context) =>
      [
        DashboardButtonModel(
          text: 'Add a new product',
          image: AssetsManager.cloud,
          onTap: () {
            Navigator.of(context)
                .pushNamed(EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonModel(
          text: 'Inspect all product',
          image: AssetsManager.shoppingCart,
          onTap: () {
            Navigator.of(context).pushNamed(SearchScreen.routeName);
          },
        ),
        DashboardButtonModel(
          text: 'View orders',
          image: AssetsManager.order,
          onTap: () {},
        ),
      ];
}
