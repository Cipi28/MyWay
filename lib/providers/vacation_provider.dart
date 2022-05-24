import 'package:flutter/cupertino.dart';
import 'package:my_way/models/vacation_model.dart';
import 'package:my_way/services/vacation_service.dart';

class VacationProvider extends ChangeNotifier {
  final VacationService _vacationService = VacationService();
  List<VacationModel> vacations = [];
  late Future getVacationsFuture;

  VacationProvider() {
    getVacationsFuture = _getVacationsFuture();
  }

  Future _getVacationsFuture() async {
    vacations = await _vacationService.getVacations();
  }

  addDummyVacation() {
    vacations.add(VacationModel(id: 0, name: 'Dummy', pointsOfInterest: []));
    notifyListeners();
  }
}
