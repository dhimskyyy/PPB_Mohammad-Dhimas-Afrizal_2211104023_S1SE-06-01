class User {
  String name;
  String description;
  String contact;

  User({
    required this.name,
    this.description = '',
    this.contact = '',
  });
}
