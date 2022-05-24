import 'package:my_way/models/point_of_interest_model.dart';

class VacationModel {
  int id;
  String name;
  List<PointOfInterestModel> pointsOfInterest = [];

  VacationModel({
    required this.id,
    required this.name,
    required this.pointsOfInterest,
  });

  factory VacationModel.fromJson(Map<String, dynamic> json) {
    return VacationModel(
        id: json['id'],
        name: json['name'],
        pointsOfInterest: (json['points'] as List)
            .map((poi) => PointOfInterestModel.fromJson(poi))
            .toList());
  }
}
