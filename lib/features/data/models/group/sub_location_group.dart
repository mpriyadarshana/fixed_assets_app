import '../model/asset.dart';

class SubLocationGroup {
  final String name;
  final List<Asset> assets;

  SubLocationGroup({
    required this.name,
    required this.assets
  });

  factory SubLocationGroup.fromJson(Map<String, dynamic> json) {
    return SubLocationGroup(
      name: json['name'],
      assets: List<Asset>.from(
        json['assets'].map((x) => Asset.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'assets': List<dynamic>.from(
        assets.map((x) => x.toJson()),
      ),
    };
  }
}