class Location {
  final int id;
  final String name;
  final String? name_short;

  Location({
    required this.id,
    required this.name,
    this.name_short,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json['id'],
    name: json['name'],
    name_short: json['name_short'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'name_short': name_short,
  };
}
