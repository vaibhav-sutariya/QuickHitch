class MakeModel {
  final String id;
  final String name;

  MakeModel({required this.id, required this.name});

  factory MakeModel.fromJson(Map<String, dynamic> json) {
    return MakeModel(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
