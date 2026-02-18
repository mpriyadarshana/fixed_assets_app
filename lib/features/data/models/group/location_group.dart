import 'sub_location_group.dart';

class LocationGroup {
  final String location;
  final List<SubLocationGroup> subLocations;

  LocationGroup({
    required this.location,
    required this.subLocations
  });

  factory LocationGroup.fromJson(Map<String, dynamic> json) {
    return LocationGroup(
      location: json['location'],
      subLocations: List<SubLocationGroup>.from(
        json['sub_locations'].map((x) => SubLocationGroup.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'sub_locations': List<dynamic>.from(
        subLocations.map((x) => x.toJson()),
      ),
    };
  }
}