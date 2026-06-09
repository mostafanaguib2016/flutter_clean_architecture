import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/app_shared_preferences.dart';
import 'package:flutter_clean_architecture/app/di.dart';
import 'package:flutter_clean_architecture/data/local_data_source/local_data_source.dart';
import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
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
              AppStrings.changeLanguage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          ),
          ListTile(
            onTap: (){
              _contactUs();
            },
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(
              AppStrings.contactUs,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          ),
          ListTile(
            onTap: (){
              _inviteFriends();
            },
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(
              AppStrings.inviteYourFriends,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          ),
          ListTile(
            onTap: (){
              _logout();
            },
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            title: Text(
              AppStrings.logout,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
          ),
        ],
      ),
    );
  }

  _changeLanguage(){

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
