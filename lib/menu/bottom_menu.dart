import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassbalconyanalysis/ui/route/routing_constans.dart';
import 'package:glassbalconyanalysis/ui/theme/cba_colors.dart';

class BottomNavMenu extends StatefulWidget {
  const BottomNavMenu({Key? key}) : super(key: key);

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {

  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: CbaColors.Blue1,
      unselectedItemColor: CbaColors.Blue2,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userLarge), label: "Users"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plus), label: "New"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compassDrafting), label: "Systems"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear), label: "Settings")
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedItemIndex,
      onTap: (index){
        setState(() {
          selectedItemIndex = index;
        });
        switch(selectedItemIndex){
          case 0:
            Navigator.pushNamed(context, HomePageRoute);
            break;
          case 1:
            Navigator.pushNamed(context, SignInRoute);
            break;
          case 2:
            Navigator.pushNamed(context, VideoRoute);
            break;
          case 3:
            Navigator.pushNamed(context, HomePageRoute);
            break;
          case 4:
            Navigator.pushNamed(context, SettingsPageRoute);
            break;
        }
      },
    );
  }
}
