import 'package:flutter/material.dart';
import 'package:my_way/providers/vacation_provider.dart';
import 'package:provider/provider.dart';

class AppBarLeadingWidget extends StatelessWidget {
  const AppBarLeadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VacationProvider>(context, listen:false);

    return GestureDetector(
      child: Image.asset('assets/img/my_way_logo.png'),
      onDoubleTap: (){
        provider.addDummyVacation();
      },
    );
  }
}
