import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washing_app/src/configs/routes/app_route.dart';
import 'package:washing_app/src/constants/constant.dart';

class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? navigator;
  final String? notification;

  const Menu(
    this.title, {
    required this.navigator,
    required this.icon,
    this.iconColor = Colors.grey,
    this.notification,
  });
}

class MenuViewModel {
  List<Menu>? menuItems;

  MenuViewModel({this.menuItems});
  List<Menu> getMenuItems(BuildContext context) => menuItems = <Menu>[
        Menu(
          Constant.MENU_WALLET,
          iconColor: const Color(0xff12606A),
          navigator: () {
            Navigator.pushNamed(
              context,
              AppRoute.wallet,
            );
          },
          icon: FontAwesomeIcons.wallet,
        )
      ];

// List<Menu> _menus(BuildContext context) = <Menu>[
//   Menu(
//     'ข้อมูลส่วนตัว',
//     icon: FontAwesomeIcons.user,
//     iconColor: const Color(0xff12606A),
//     navigator: () {
//       Navigator.pushNamed(
//         context,
//         Constant.PROFILE_ROUTE,
//       );
//       print('na');
//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => ProfilePage()));
//     },
//   ),
// ];
//
// MenuViewModel();
//
// List<Menu> get items => _menus;
}
