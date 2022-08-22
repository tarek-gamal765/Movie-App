
class MovieGenresModel {
  final int id;
  final String name;

  const MovieGenresModel({required this.id, required this.name});

  factory MovieGenresModel.formJson(Map<String, dynamic> json) => MovieGenresModel(
    id: json['id'],
    name: json['name'],
  );
}
