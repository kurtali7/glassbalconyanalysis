import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';

import '../ui/route/routing_constans.dart';
import '../ui/theme/cba_colors.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.building,
                  color: CbaColors.Blue1,
                  size: 45.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child:
                  Text("Kullanıcı Adı", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                ),
                Text("Firma Adı",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.house, color: CbaColors.PrimaryColor),
            title: Text('anasayfa'.i18n()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.building, color: CbaColors.PrimaryColor),
            title: Text('firmaBilgileri'.i18n()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.userLarge, color: CbaColors.PrimaryColor),
            title: Text('users'.i18n()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.userLarge, color: CbaColors.PrimaryColor),
            title:
            Text('employies'.i18n()),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.circleUser, color: CbaColors.PrimaryColor),
            title:
            Text('musteriler'.i18n()),
            onTap: () {
              //Navigator.pushNamed(context, PriceSettingsRoute);
            },
          ),
          ListTile(
            leading:
            const Icon(FontAwesomeIcons.layerGroup, color: CbaColors.PrimaryColor),
            title: Text('stokTakibi'.i18n()),
            onTap: () {
              //Navigator.pushNamed(context, SettingsPageRoute);
            },
          ),
          ListTile(
            leading:
            const Icon(FontAwesomeIcons.compassDrafting, color: CbaColors.PrimaryColor),
            title: Text('sistemler'.i18n()),
            onTap: () {
              //Navigator.pushNamed(context, SettingsPageRoute);
            },
          ),
          ListTile(
            leading:
            const Icon(FontAwesomeIcons.gear, color: CbaColors.PrimaryColor),
            title: Text('settings'.i18n()),
            onTap: () {
              Navigator.pushNamed(context, SettingsPageRoute);
            },
          ),
          ListTile(
            leading:
            const Icon(FontAwesomeIcons.circleQuestion, color: CbaColors.PrimaryColor),
            title: Text('yardim'.i18n()),
            onTap: () {
              //Navigator.pushNamed(context, SettingsPageRoute);
            },
          ),
        ],
      ),
    );
  }
}
