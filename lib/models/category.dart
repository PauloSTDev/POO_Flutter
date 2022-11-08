class Category {
  int id;
  String name;
  String description;

  Category(
      this.id,
      this.name,
      this.description
      );

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}