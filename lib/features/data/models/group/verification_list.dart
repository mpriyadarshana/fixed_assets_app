import 'package:fixed_assets_app/features/data/models/group/location_group.dart';

import 'location_group.dart';

class  VerificationList{
  final List<LocationGroup> locations;

  VerificationList({
    required this.locations
  });

  factory VerificationList.fromJson(Map<String, dynamic> json) {
    return VerificationList(
      locations: List<LocationGroup>.from(
        json['location'].map((x) => LocationGroup.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(
        locations.map((x) => x.toJson()),
      ),
    };
  }
}