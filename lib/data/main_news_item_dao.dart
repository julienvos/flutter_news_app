import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_news/models/main_news_model/main_news_model.dart';

class MainNewsDAO {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('MainNews');

// not necessary for now
  void saveNewsItem(MainNewsModel item) {
    collection.add(item.toJson());
  }

  Stream<QuerySnapshot> getStream() {
    // return collection.snapshots();

    // //get latest first
    return collection.orderBy('date', descending: false).snapshots();

    // ore use the index option in the firestore (choose one of them)
  }
}
