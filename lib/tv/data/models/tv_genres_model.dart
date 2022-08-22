
class TvGenresModel {
  final int id;
  final String name;

  const TvGenresModel({required this.id, required this.name});

  factory TvGenresModel.formJson(Map<String, dynamic> json) => TvGenresModel(
    id: json['id'],
    name: json['name'],
  );
}
