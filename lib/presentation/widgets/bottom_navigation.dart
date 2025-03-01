import 'package:church_navigation/config/routes.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '즐겨찾기'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.mainMap);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.searchModal);
            break;
          case 2:
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.setting);
            break;
        }
      },
    );
  }
}
