import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washing_app/src/configs/routes/app_route.dart';
import 'package:washing_app/src/constants/app_setting.dart';
import 'package:washing_app/src/utils/services/local_storage_service.dart';
import 'package:washing_app/src/viewmodels/menu_viewmodel.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: _buildMainMenu(context),
          ),
          const Spacer(),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.arrowRightFromBracket,
              color: Colors.red,
            ),
            title: const Text(
              'ออกจากระบบ',
            ),
            onTap: () => _showDialogLogout(context),
          )
        ],
      ),
    );
  }

  DrawerHeader _buildDrawerHeader() => DrawerHeader(
        child: Column(
          children: [
            FutureBuilder<String>(
                future: LocalStorageService().getName(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(snapshot.data ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)));
                }),
          ],
        ),
      );

  ListView _buildMainMenu(BuildContext context) {
    final List<Menu> menus = MenuViewModel().getMenuItems(context);
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final model = menus[index];

        return TextButton(
          onPressed: () => model.navigator!(),
          child: ListTile(
            leading: FaIcon(
              model.icon,
              color: model.iconColor,
            ),
            title: Text(
              model.title,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 5,
          indent: 80,
        );
      },
      itemCount: menus.length,
    );
  }

  void _showDialogLogout(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        content: const Text('คุณแน่ใจหรือไม่ว่าคุณต้องการออกจากระบบ?'),
        actions: <Widget>[
          TextButton(
            child: const Text('ยกเลิก'),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final pref = await SharedPreferences.getInstance();
              pref.remove(AppSetting.token);

              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.login,
                (Route<dynamic> route) => false,
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}
