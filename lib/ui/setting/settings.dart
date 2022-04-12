import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassbalconyanalysis/ui/loading_state_view_model.dart';
import 'package:glassbalconyanalysis/ui/theme/cba_colors.dart';
import 'package:glassbalconyanalysis/ui/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localization/localization.dart';
import 'package:shared_preferences_settings/shared_preferences_settings.dart';

class SettingsPage extends StatefulHookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userViewModelProvider.select((value) => value.user));
    final userViewModel = ref.watch(userViewModelProvider);
    final loading = ref.watch(loadingStateProvider);

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
              title: user?.name ?? '-',
              subtitle: user?.email ?? '-',
            ),
            SimpleSettingsTile(
              icon: Icon(
                FontAwesomeIcons.dollarSign,
                color: CbaColors.Blue1,
              ),
              title: user!=null ? 'Premium Hesaba Sahipsiniz' : '-',
              subtitle: user!=null ? 'Bitiş Tarihi: 01.01.2222' : '-',
            ),
            ListTile(
                leading: const Icon(
                  FontAwesomeIcons.arrowRightToBracket,
                  color: CbaColors.Blue1,
                ),
                title: Text(user!=null ? 'cikis'.i18n() : 'girisyap'.i18n()),
                onTap: () => {
                  if(user!=null){
                    userViewModel.signOut
                  }else{
                    loading.whileLoading(() async {
                      return ref.watch(userViewModelProvider).signIn();
                    })
                  }
                }
            )
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
              values: {
                'a': 'TL',
                'b': 'EURO',
                'c': 'DOLLAR'
              },
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
                title: 'Doğru maliyet ve ölçü hesabı için önce sistem ayarlarınızı yapınız. Hesaplama işlemlerinden sonra kontrollerinizi tarafınızca sağlayınız. Oluşabilecek hatalardan tarafımız sorumlu değildir..',
              ),
            ],
          )
        ],
      ),
    );
  }
}
