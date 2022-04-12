import 'package:flutter/material.dart';

import '../ui/theme/cba_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  const BaseAppBar({Key? key, required this.title, required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: CbaColors.PrimaryColor), textAlign: TextAlign.start,),
      backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: CbaColors.PrimaryColor)
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}