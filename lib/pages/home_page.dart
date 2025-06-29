// Flutter框架核心包
import 'package:flutter/material.dart';
import 'package:nft/main.dart';
import 'package:nft/util/glass_box.dart';
import 'package:nft/components/my_tabbar.dart';
import 'package:nft/tabs/labubu_tabs.dart';
import '../components/my_appbar.dart';
import '../components/my_bottombar.dart';
import '../theme/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void searchButtonTapped() {}

  List tabOption = [
    ["Labubu1", Labubu1()],
    ["Labubu2", Labubu2()],
    ["Labubu3", Labubu3()],
    ["Labubu4", Labubu4()],
    ["Labubu5", Labubu5()],
    ["Labubu6", Labubu6()],
  ];

  int _currentBottonIndex = 0;

  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottonIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottonIndex,
            onTap: _handleIndexChanged,
          )
        ),
        body: ListView(
          children: [
            MyAppBar(
              title: 'Labubu Collections',
              onSearchTap: searchButtonTapped,
            ),
            SizedBox(
              height: 520,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
