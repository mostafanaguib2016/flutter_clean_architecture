import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/data/local_data_source/local_data_source.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/language_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final AppSharedPreferences _preferences = instance<AppSharedPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(AppPaddings.p8),
        children: [
          ListTile(
            onTap: (){
              _changeLanguage();
            },
            leading: SvgPicture.asset(ImageAssets.changeLangIc),
            title: Text(
              AppStrings.changeLanguage.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: _getItemTrailing(),
          ),
          ListTile(
            onTap: (){
              _contactUs();
            },
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(
              AppStrings.contactUs.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: _getItemTrailing(),
          ),
          ListTile(
            onTap: (){
              _inviteFriends();
            },
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(
              AppStrings.inviteYourFriends.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: _getItemTrailing(),
          ),
          ListTile(
            onTap: (){
              _logout();
            },
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            title: Text(
              AppStrings.logout.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: _getItemTrailing(),
          ),
        ],
      ),
    );
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  _changeLanguage(){
    _preferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  Widget _getItemTrailing(){
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
        child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc));
  }

  _contactUs(){}

  _inviteFriends(){}

  _logout(){
    // logout & clear cache
    _preferences.logout();

    _localDataSource.clearCache();

    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }
}
