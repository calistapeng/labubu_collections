import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyTabBar extends StatelessWidget {
  final List tabOptions;
  
  MyTabBar({
    Key? key,
    required this.tabOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),
          unselectedLabelColor: Colors.grey[500],
          labelColor: Colors.grey[800],
          labelStyle: GoogleFonts.bebasNeue(fontSize: 32),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE91E63),
                width: 3.0,
              ),
            ),
          ),
          tabs: [
            Tab(
              child: Text(tabOptions[0][0]),
            ),
            Tab(
              child: Text(tabOptions[1][0]),
            ),
            Tab(
              child: Text(tabOptions[2][0]),
            ),
            Tab(
              child: Text(tabOptions[3][0]),
            ),
            Tab(
              child: Text(tabOptions[4][0]),
            ),
            Tab(
              child: Text(tabOptions[5][0]),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              tabOptions[0][1],
              tabOptions[1][1],
              tabOptions[2][1],
              tabOptions[3][1],
              tabOptions[4][1],
              tabOptions[5][1],
            ],
          ),
        )
      ],
    );
  }
}
