class Category {
  String name, image;

  Category({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  Map<String, dynamic> toFirebaseMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  factory Category.fromFirebaseMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}