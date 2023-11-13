class MyModel {
  int id;
  String name;
  String? designation;

  MyModel({
    required this.id,
    required this.name,
    this.designation,
  });
}
