import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MainNewsModel {
  String? title;
  String? category;
  String? publisher;
  // String? imageUrl;
  String? description;

  DocumentReference? reference;

  DateTime date;

  MainNewsModel(
      {this.title,
      this.category,
      this.publisher,
      // this.imageUrl,
      this.description,
      this.reference,
      required this.date});

  @override
  String toString() {
    return 'MainNewsModel(title: $title, date: $date, category: $category, publisher: $publisher, description: $description)';
  }
  //, imageUrl: $imageUrl

  factory MainNewsModel.fromMap(Map<String, dynamic> data) => MainNewsModel(
      title: data['title'] as String?,
      category: data['category'] as String?,
      publisher: data['publisher'] as String?,
      // imageUrl: data['imageUrl'] as String?,
      description: data['description'] as String?,
      date: DateTime.fromMicrosecondsSinceEpoch(data['date']));

  Map<String, dynamic> toMap() => {
        'title': title,
        'date': date.microsecondsSinceEpoch,
        'category': category,
        'publisher': publisher,
        // 'imageUrl': imageUrl,
        'description': description
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MainNewsModel].
  factory MainNewsModel.fromJson(String data) {
    return MainNewsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MainNewsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  factory MainNewsModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newMainNewsModel = MainNewsModel.fromMap(
        snapshot.data() as Map<String, dynamic>); // decode json data
    newMainNewsModel.reference = snapshot.reference;
    return newMainNewsModel;
  }
}
