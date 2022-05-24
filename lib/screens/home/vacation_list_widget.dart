import 'package:flutter/material.dart';
import 'package:my_way/core/custom_colors.dart';
import 'package:my_way/providers/vacation_provider.dart';
import 'package:provider/provider.dart';

import '../map/map_page.dart';

class VacationListWidget extends StatefulWidget {
  const VacationListWidget({Key? key}) : super(key: key);

  @override
  State<VacationListWidget> createState() => _VacationListWidgetState();
}

class _VacationListWidgetState extends State<VacationListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<VacationProvider>(context);

    return FutureBuilder(
      future: provider.getVacationsFuture,
      builder: (BuildContext ctx, AsyncSnapshot asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.done) {
          if (asyncSnapshot.hasError) {
            return const Center(child: Text('Could not get vacations.'));
          }
          return ListView.builder(
            itemCount: provider.vacations.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: CustomColors.borderColor),
                ),
                child: ListTile(
                  title: Text(provider.vacations[index].name),
                  leading: Icon(Icons.beach_access_outlined,
                      color: CustomColors.nroGreen, size: 40),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.map_outlined,
                      color: CustomColors.mapIconColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapPage(
                                  vacation: provider.vacations[index])));
                    },
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
