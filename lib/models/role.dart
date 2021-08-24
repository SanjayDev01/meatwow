class Roles {
  final String id;
  final String type;
  final int v;

  Roles({
    this.id,
    this.type,
    this.v,
  });

  factory Roles.fromJson(Map<String, dynamic> parsedJson) {
    return Roles(
      id: parsedJson['_id'],
      type: parsedJson['type'],
      v: parsedJson['__v'],
    );
  }
}
