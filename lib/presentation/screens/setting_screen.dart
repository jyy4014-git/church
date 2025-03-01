import 'package:church_navigation/config/routes.dart';
import 'package:church_navigation/data/providers/auth_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:church_navigation/presentation/widgets/bottom_navigation.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting").tr()),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Language").tr(),
            trailing: DropdownButton<Locale>(
              value: context.locale,
              items:
                  context.supportedLocales
                      .map(
                        (locale) => DropdownMenuItem(
                          value: locale,
                          child: Text(locale.languageCode),
                        ),
                      )
                      .toList(),
              onChanged: (locale) async {
                if (locale != null) {
                  await context.setLocale(locale);
                }
              },
            ),
          ),
          ListTile(
            title: const Text("Logout").tr(),
            onTap: () async {
              // 로그아웃 로직 구현
              await ref.read(authProvider.notifier).logout();
              // 로그아웃 후 로그인 화면으로 이동
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
