import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_admin_ar/models/dashboard_button_model.dart';
import 'package:shopsmart_admin_ar/widgets/dashboard_button.dart';
import 'package:shopsmart_admin_ar/widgets/title_text.dart';

import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(label: "Dashboard Screen"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.setDarkTheme(
                  themeValue: !themeProvider.getIsDarkTheme);
            },
            icon: Icon(themeProvider.getIsDarkTheme
                ? Icons.light_mode
                : Icons.dark_mode),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          DashboardButtonModel.dashboardButtonsList(context).length,
          (index) => DashboardButtonWidget(
            text:
                DashboardButtonModel.dashboardButtonsList(context)[index].text,
            image:
                DashboardButtonModel.dashboardButtonsList(context)[index].image,
            onTap:
                DashboardButtonModel.dashboardButtonsList(context)[index].onTap,
          ),
        ),
      ),
    );
  }
}
