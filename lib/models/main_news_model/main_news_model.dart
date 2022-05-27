import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MainNewsModel {
  String? title;
  DateTime? date;
  String? category;
  String? publisher;
  String? imageUrl;

  DocumentReference? reference;

  MainNewsModel(
      {this.title,
      this.date,
      this.category,
      this.publisher,
      this.imageUrl,
      this.reference});

  @override
  String toString() {
    return 'MainNewsModel(title: $title, date: $date, category: $category, publisher: $publisher, imageUrl: $imageUrl)';
  }

  factory MainNewsModel.fromMap(Map<String, dynamic> data) => MainNewsModel(
        title: data['title'] as String?,
        date: (data['date'] as Timestamp).toDate(),
        category: data['category'] as String?,
        publisher: data['publisher'] as String?,
        imageUrl: data['imageUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'date': date,
        'category': category,
        'publisher': publisher,
        'imageUrl': imageUrl,
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
