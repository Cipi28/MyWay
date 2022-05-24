import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:flutter/material.dart';
import 'package:my_way/providers/vacation_provider.dart';
import 'package:my_way/screens/home/my_way_home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'core/constants.dart';
import 'core/custom_colors.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _configureLogger(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (BuildContext ctx) => VacationProvider()),
            ],
            child: MaterialApp(
              title: 'My Way',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.transparent,
                colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.nroGreen, primary: CustomColors.nroGreen, secondary: CustomColors.secondaryNroGreen),
                fontFamily: 'Sansita',
              ),
              home: const MyWayHomePage(),
            ),
          );
        }
      },
    );
  }
}

Future _configureLogger() async {
  final directory = await getExternalStorageDirectory();
  if (directory?.path != null) {
    final Directory _appDocDirFolder = Directory('${directory!.path}/Log');
    if (!await _appDocDirFolder.exists()) {
      await _appDocDirFolder.create(recursive: true);
    }
    var logTree = SizeRollingFileTree(
      DataSize.mega(10),
      filenamePrefix: '${_appDocDirFolder.path}/${Constants.logPrefix}',
      filenamePostfix: Constants.logPostfix,
    );
    Fimber.plantTree(logTree);
  }
}
