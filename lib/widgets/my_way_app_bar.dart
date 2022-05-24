import 'package:flutter/material.dart';
import 'package:my_way/widgets/app_bar_leading_widget.dart';

class MyWayAppBar extends AppBar {
  final String appBarTitle;

  MyWayAppBar({Key? key, required this.appBarTitle})
      : super(
          key: key,
          title: Text(appBarTitle),
          leading: const AppBarLeadingWidget(),
        );
}
