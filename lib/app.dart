import 'package:church_navigation/config/routes.dart';
import 'package:church_navigation/presentation/screens/location_detail_screen.dart';
import 'package:church_navigation/presentation/screens/login_screen.dart';
import 'package:church_navigation/presentation/screens/search_modal_screen.dart';
import 'package:church_navigation/presentation/screens/main_map_screen.dart';
import 'package:church_navigation/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';

class ChurchApp extends StatelessWidget {
  const ChurchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Church Community', // 앱 이름
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.mainMap: (context) => const MainMapScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.setting: (context) => const SettingScreen(),
        AppRoutes.locationDetail: (context) {
          final locationId = ModalRoute.of(context)?.settings.arguments as int;
          log('$locationId');
          return LocationDetailScreen(locationId: locationId);
        },
        AppRoutes.searchModal: (context) => const SearchModalScreen(),
      },
    );
  }
}
