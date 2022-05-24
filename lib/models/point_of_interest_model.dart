class PointOfInterestModel {
  String name;
  String address;
  double latitude;
  double longitude;

  PointOfInterestModel({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory PointOfInterestModel.fromJson(Map<String, dynamic> json) {
    return PointOfInterestModel(
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
