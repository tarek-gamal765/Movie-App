
class GenresModel {
  final int id;
  final String name;

  const GenresModel({required this.id, required this.name});

  factory GenresModel.formJson(Map<String, dynamic> json) => GenresModel(
    id: json['id'],
    name: json['name'],
  );
}
