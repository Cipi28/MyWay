import 'dart:convert';
import 'dart:io';

import 'package:fimber_io/fimber_io.dart';
import 'package:http/http.dart';
import 'package:my_way/models/vacation_model.dart';

class VacationService {
  final String _baseUri = 'https://ligalabsnet.stage02.netromsoftware.ro';
  final String _resourceName = 'api/vacations';
  final Duration _timeout = const Duration(seconds: 25);

  Future<List<VacationModel>> getVacations() async {
    try {
      var response = await get(Uri.parse('$_baseUri/$_resourceName')).timeout(_timeout);

      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> decodedBody = jsonDecode(response.body);
        List<VacationModel> vacations = decodedBody.map((e) => VacationModel.fromJson(e)).toList();

        Fimber.i('Get vacations #${vacations.length}');

        return vacations;
      } else {
        var exceptionMessage = jsonDecode(response.body);
        Fimber.e(exceptionMessage);
        throw Exception('GET vacations status code ${response.statusCode}.');
      }
    } catch (ex, stackTrace) {
      Fimber.e('Unhandled exception', ex: ex, stacktrace: stackTrace);
      throw Exception('Failed to get vacations.');
    }
  }
}
