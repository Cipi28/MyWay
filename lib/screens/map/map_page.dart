import 'package:flutter/material.dart';
import 'package:my_way/models/vacation_model.dart';
import 'package:my_way/screens/map/map_widget.dart';

class MapPage extends StatelessWidget {
  final VacationModel vacation;

  const MapPage({Key? key, required this.vacation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Vacation details"),
        ),
        body: MapWidget(vacation: vacation));
  }
}
