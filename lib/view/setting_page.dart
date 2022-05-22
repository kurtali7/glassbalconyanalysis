import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassbalconyanalysis/data/model/app_user.dart';
import 'package:glassbalconyanalysis/viewmodel/setting_view_model.dart';
import 'package:localization/localization.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';
import '../ui/loading_state_view_model.dart' as loading;
import '../ui/theme/cba_colors.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SettingViewModel _viewModel = SettingViewModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel.getAuthUser();
    print("userrr ${_viewModel.user?.paketType}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(
        title: 'settings'.i18n(),
        children: [
          SettingsTileGroup(title: 'bilgilerim'.i18n(), children: [
            SimpleSettingsTile(
              icon: Icon(
                FontAwesomeIcons.userLarge,
                color: CbaColors.Blue1,
              ),
              title: _viewModel.user?.name ?? '-',
              subtitle: _viewModel.user?.mail ?? '-',
              visibleByDefault: _viewModel.user != null ? true : false,
            ),
            SimpleSettingsTile(
              icon: Icon(
                FontAwesomeIcons.dollarSign,
                color: CbaColors.Blue1,
              ),
              title: _viewModel.user?.paketType ?? '-',
              subtitle: _viewModel.user?.endDate.toString() ?? '-',
              visibleByDefault: _viewModel.isAuthenticated ? true : false,
            ),
            ListTile(
                leading: const Icon(
                  FontAwesomeIcons.arrowRightToBracket,
                  color: CbaColors.Blue1,
                ),
                title: Text(_viewModel.isAuthenticated
                    ? 'cikis'.i18n()
                    : 'girisyap'.i18n()),
                onTap: () async => {
                      if (_viewModel.isAuthenticated)
                        await _viewModel.signOut()
                      else
                        await _viewModel.signIn(),

                      setState(() {

                      }),
                    })
          ]),
          SettingsTileGroup(title: 'uygulamaayarlari'.i18n(), children: [
            RadioPickerSettingsTile(
              settingKey: 'language',
              title: 'language'.i18n(),
              icon: Icon(
                FontAwesomeIcons.globe,
                color: CbaColors.Blue1,
              ),
              values: {
                'a': 'turkish'.i18n(),
                'b': 'english'.i18n(),
              },
              defaultKey: 'a',
              cancelCaption: 'cancel'.i18n(),
              okCaption: 'save'.i18n(),
            ),
            RadioPickerSettingsTile(
              settingKey: 'currency',
              title: 'currency'.i18n(),
              icon: Icon(
                FontAwesomeIcons.moneyBill1,
                color: CbaColors.Blue1,
              ),
              values: {'a': 'TL', 'b': 'EURO', 'c': 'DOLLAR'},
              defaultKey: 'a',
              cancelCaption: 'cancel'.i18n(),
              okCaption: 'save'.i18n(),
            ),
            TextFieldModalSettingsTile(
              settingKey: 'teklif',
              title: 'teklifsartlariniduzenle'.i18n(),
              keyboardType: TextInputType.text,
              defaultValue: '',
              cancelCaption: 'cancel'.i18n(),
              okCaption: 'save'.i18n(),
              icon: Icon(
                FontAwesomeIcons.clipboardList,
                color: CbaColors.Blue1,
              ),
            ),
          ]),
          SettingsTileGroup(
            title: 'sistemayarlari'.i18n(),
            children: [
              TextFieldModalSettingsTile(
                settingKey: 'EMP_EXP',
                title: 'iscilikgideri'.i18n(),
                keyboardType: TextInputType.number,
                defaultValue: '0',
                cancelCaption: 'cancel'.i18n(),
                okCaption: 'save'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.calculator,
                  color: CbaColors.Blue1,
                ),
              ),
              TextFieldModalSettingsTile(
                settingKey: 'fire_orani',
                title: 'fireorani'.i18n(),
                keyboardType: TextInputType.number,
                defaultValue: '0',
                cancelCaption: 'cancel'.i18n(),
                okCaption: 'save'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.calculator,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'kdv',
                title: 'teklifekdvekle'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.dollarSign,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'siyahbeyazcikti',
                title: 'ciktilardacamlaribeyazgöster'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.image,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'teklifolcu',
                title: 'teklifdeolcugizle'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.image,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'resim',
                title: 'usttengorunusgoster'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.image,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'aldoksm2',
                title: 'aldoksm2hesapla'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.calculator,
                  color: CbaColors.Blue1,
                ),
              ),
              SwitchSettingsTile(
                settingKey: 'stok',
                title: 'stoktandus'.i18n(),
                icon: Icon(
                  FontAwesomeIcons.chartLine,
                  color: CbaColors.Blue1,
                ),
              ),
              SimpleSettingsTile(
                title:
                    'Doğru maliyet ve ölçü hesabı için önce sistem ayarlarınızı yapınız. Hesaplama işlemlerinden sonra kontrollerinizi tarafınızca sağlayınız. Oluşabilecek hatalardan tarafımız sorumlu değildir..',
              ),
            ],
          )
        ],
      ),
    );
  }
}
