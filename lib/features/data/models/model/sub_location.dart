class Slocation {
  final int id;
  final String name;
  final int locationId;

  Slocation({
    required this.id,
    required this.name,
    required this.locationId,
  });

  factory Slocation.fromJson(Map<String, dynamic> json) => Slocation(
    id: json['id'],
    name: json['name'],
    locationId: json['locationId'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'locationId': locationId,
  };
}
