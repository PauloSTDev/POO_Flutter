class Category {
  int id;
  String name;
  String description;

  Category(
      this.id,
      this.name,
      this.description
      );

  categoryMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    return map;
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}