import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/categories_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/orders_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/products_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/uploade_banners_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:bobde6_multi_web_admin/views/screens/side_bar_screens/withdrawal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = DashboardScreen();

  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case VendorScreen.routeName:
        setState(() {
          _selectedItem = VendorScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = CategoriesScreen();
        });
        break;
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = OrderScreen();
        });
        break;
      case UploadBannersScreen.routeName:
        setState(() {
          _selectedItem = UploadBannersScreen();
        });
        break;
      case WithdrawalScreen.routeName:
        setState(() {
          _selectedItem = WithdrawalScreen();
        });
        break;
      case ProductScreen.routeName:
        setState(() {
          _selectedItem = ProductScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Management'),
        ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(
              title: 'Dashboard',
              icon: Icons.dashboard,
              route: DashboardScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Vendors',
              icon: CupertinoIcons.person_3,
              route: VendorScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Withdrawal',
              icon: CupertinoIcons.money_dollar,
              route: WithdrawalScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Orders',
              icon: CupertinoIcons.shopping_cart,
              route: OrderScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Categories',
              icon: Icons.category,
              route: CategoriesScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Upload Banners',
              icon: CupertinoIcons.add,
              route: UploadBannersScreen.routeName,
            ),
            AdminMenuItem(
              title: 'Products',
              icon: Icons.shop,
              route: ProductScreen.routeName,
            ),
          ],
          selectedRoute: '/',
          onSelected: (item) {
            screenSelector(item);
          },
          header: Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
            child: Center(
              child: Text(
                'Bobde6 builder Store platform',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
            child: Center(
              child: Text(
                'footer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: _selectedItem);
  }
}
