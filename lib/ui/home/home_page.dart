import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassbalconyanalysis/menu/bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';

import '../../menu/app_bar.dart';
import '../../menu/drawer_menu.dart';
import '../theme/cba_colors.dart';
import '../user_view_model.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends ConsumerState<HomePage>{

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userViewModelProvider.select((value) => value.user));

    return Scaffold(
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomNavMenu(),
      appBar: BaseAppBar(
          title: 'appname'.i18n(),
          appBar: AppBar()
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(8,8,0,0),
                child: Text("Paket Tipi", style: TextStyle( color: CbaColors.PrimaryColor, fontSize: 12),)
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(8,4,8,0),
                child: Text(user?.name?? "Test", style: TextStyle( color: CbaColors.PrimaryDarkColor, fontSize: 18, fontWeight: FontWeight.w700),)
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8,4,8,12),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("06 Nisan Çarşamba", style: TextStyle( color: CbaColors.PrimaryColor, fontSize: 12, fontWeight: FontWeight.w700),),
                    Text("Dolar: 14.7296", style: TextStyle( color: CbaColors.PrimaryColor, fontSize: 12, fontWeight: FontWeight.w700),),
                    Text("LME: 3414 ", style: TextStyle( color: CbaColors.PrimaryColor, fontSize: 12, fontWeight: FontWeight.w700),)
                  ]
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0,0,0,4),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TopMenuWidget(FontAwesomeIcons.plus,'projeolustur'.i18n(), CbaColors.Blue1),
                  TopMenuWidget(FontAwesomeIcons.receipt,'hizliteklifolustur'.i18n(),CbaColors.Green1),
                  TopMenuWidget(FontAwesomeIcons.phone,'iletisim'.i18n(), CbaColors.Red1),
                  TopMenuWidget(FontAwesomeIcons.chartLine,'raporlar'.i18n(), CbaColors.Yellow1),
                  TopMenuWidget(FontAwesomeIcons.fileExcel,'exceleaktar'.i18n(),CbaColors.Green1),
                  TopMenuWidget(FontAwesomeIcons.circleQuestion,'yardim'.i18n(), CbaColors.Blue1),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ProjectWidget(FontAwesomeIcons.clipboardList,'teklifVerilenProjeler'.i18n(), CbaColors.Green1),
                  ProjectWidget(FontAwesomeIcons.check,'onaylananProjeler'.i18n(),CbaColors.Green2),
                  ProjectWidget(FontAwesomeIcons.clockRotateLeft,'imalatiBaslayanProjeler'.i18n(), CbaColors.Blue1),
                  ProjectWidget(FontAwesomeIcons.clipboardCheck,'bitmisProjeler'.i18n(), CbaColors.Yellow1),
                  ProjectWidget(FontAwesomeIcons.circleExclamation,'arizaliProjeler'.i18n(),CbaColors.Red1),
                  ProjectWidget(FontAwesomeIcons.dollarSign,'odemesiBekleyenProjeler'.i18n(), CbaColors.Green1),
                  ProjectWidget(FontAwesomeIcons.receipt,'camSiparisleri'.i18n(), CbaColors.PrimaryAssentColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final IconData icon;
  final String description;
  final Color headerColor;
  const ProjectWidget(
      this.icon,
      this.description,
      this.headerColor, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.headerColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          //Navigator.pushNamed(context, ProjectsPageRoute);// TODO: degisecek
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    icon,
                    size: 22.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,8,8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(description, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,), textAlign: TextAlign.start,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopMenuWidget extends StatelessWidget {
  final IconData icon;
  final String description;
  final Color color;
  const TopMenuWidget(
      this.icon,
      this.description,
      this.color, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          //Navigator.pushNamed(context, ProjectsPageRoute);// TODO: degisecek
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12,12,0,12),
                  child: Icon(
                      icon,
                      size: 20.0,
                      color: this.color
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(description, style: TextStyle(color: this.color, fontSize: 18, fontWeight: FontWeight.w600,), textAlign: TextAlign.start,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
