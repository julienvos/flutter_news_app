import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_news/models/main_news_model/main_news_model.dart';
import 'package:path/path.dart';

class MainNewsDAO {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('MainItem');
  // allernieuwste eerste
  // en maar eentje nodig

  void saveNewsItem(MainNewsModel item) {
    collection.add(item.toMap());
  }

  Future uploadImage(image) async {
    try {
      if (image == null) return;

      final imageName = basename(
          image!.path); // to get only the image name and not the whole location
      final destination = 'images/$imageName';
      final ref = FirebaseStorage.instance.ref('$destination');
      final task = ref.putFile(image);

      if (task == null) return;

      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();

      // print('Doenloadink = $urlDownload');
      // print(urlDownload);
      return urlDownload;
    } on FirebaseException catch (e) {
      return;
    }
  }

  //get the image from storage
  // final files = FirebaseStorage.instance.ref('/flamelink/media');

  //upload media via de UI >>> via een extra tab (+) op home!

  Stream<QuerySnapshot> getStream() {
    // return collection.snapshots();
    // //get latest first
    return collection.orderBy('date', descending: true).snapshots();

    // ore use the index option in the firestore (choose one of them)
  }
}
