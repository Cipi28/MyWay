import 'package:flutter/material.dart';
import 'package:my_way/screens/home/vacation_list_widget.dart';
import 'package:my_way/widgets/my_way_app_bar.dart';

class MyWayHomePage extends StatelessWidget {
  final String _title = 'My Way Home';

  const MyWayHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/img/background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.lighten),
            ),
          ),
        ),
        Scaffold(
          body: const VacationListWidget(),
          appBar: MyWayAppBar(appBarTitle: _title),
        ),
      ],
    );
  }
}
