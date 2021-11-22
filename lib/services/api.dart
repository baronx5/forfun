import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/category.dart';


final db = FirebaseFirestore.instance;
final CollectionReference _categoriesCollection = db.collection('categories');


Future<List<Category>> getAllCategories() async {
  return await _categoriesCollection.get().then((value) => value.docs
      .map((e) => Category.fromFirebaseMap(e.data() as Map<String, dynamic>)).toList());
}