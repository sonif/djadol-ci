<?php 
$class_name = ucfirst($name);
$string = "
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '".$name."_model.dart';



class ".$class_name."Service {
  final String tableName = '".$table_name."';

  Stream<List<".$class_name.">> getList()  {
    return Firestore.instance.collection(tableName).orderBy('createdAt',descending: true).snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => ".$class_name.".fromMap(doc.data, doc.documentID),
          ).toList(),
        );
  }

  Stream<List<".$class_name.">> getListOwner(String uid) {
    return Firestore.instance.collection(tableName).where('createdBy', isEqualTo: uid).orderBy('createdAt',descending: true).snapshots().map(
          (snapshot) => snapshot.documents.map(
            (doc) => ".$class_name.".fromMap(doc.data, doc.documentID),
          ).toList(),
        );
  }

  Future<void> add(".$class_name." item) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    item.createdBy = user.uid;
    item.createdAt = DateTime.now().microsecondsSinceEpoch;
    return Firestore.instance.collection(tableName).document().setData(item.toMap());
  }

  Future<void> edit(String id, ".$class_name." item) {
    return Firestore.instance.collection(tableName).document(id).updateData(item.toMap());
  }

  Future<void> delete(String id) {
    return Firestore.instance.collection(tableName).document(id).delete();
  }

  Future<String> uploadImage(File fileImage) async {
    final StorageReference postImageRef = FirebaseStorage.instance.ref().child('photoabsen');
    var timeKey = new DateTime.now();
    final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString()+'.jpg').putFile(fileImage);

    final StreamSubscription<StorageTaskEvent> streamSubscription = uploadTask.events.listen((event) {
      // You can use this to notify yourself or your user in any kind of way.
      // For example: you could use the uploadTask.events stream in a StreamBuilder instead
      // to show your user what the current status is. In that case, you would not need to cancel any
      // subscription as StreamBuilder handles this automatically.

      // Here, every StorageTaskEvent concerning the upload is printed to the logs.
      print('EVENT \${event.type}');
      print('EVENT \${event.snapshot.bytesTransferred}');
    });

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    
    return imageUrl.toString();
  }

}
";
echo $string;

 ?>
