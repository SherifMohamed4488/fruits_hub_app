import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:fruits_hub/Core/utils/backensd_endpoints.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  ///add data to firestore
  Future <void> addData ({ required String path, required Map<String, dynamic> data ,  String? documentId})async{

if(documentId != null ){

      await firestore.collection(path).doc(documentId).set(data);

      }else{

      await firestore.collection(path).add(data);

     }

  }

  ///get data from firestore
  Future <dynamic> getData ({ required String path,  String? documentId , Map<String, dynamic>?  query})async{



   if (documentId != null) {
     print("documneted id not equal null");

     var data =  await firestore.collection(path).doc(documentId).get();
     print("data with documneted id is called success");

     return data.data();
   }else{

     Query<Map<String, dynamic>> data =  await firestore.collection(path);
     if(query != null ){

      if(query["orderBy"] != null){

        var orderByField = query["orderBy"];
        var descending = query["descending"];
        data = data.orderBy(orderByField , descending:  descending);

      }

      if(query["limit"] != null){

        var limit = query["limit"];

        data = data.limit(limit);

      }


     }

  var result= await data.get();
     return result.docs.map((e)=> e.data()).toList();
   }

  }

  Future <bool> checkIfDataExist ({ required String path, required String documentId})async{



    var data =  await firestore.collection(path).doc(documentId).get();

    return data.exists;

  }

  @override
  Future updateUserName({required String name})async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) throw Exception("User not logged in");

    await FirebaseFirestore.instance.collection(BackendEndpoints.getUserData).doc(uid).update({

      'name': name
    });

    // كمان نحدث البيانات داخل الذاكرة


  }

  @override
  Future updateUserEmail({required String email})async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) throw Exception("User not logged in");
    // await FirebaseAuth.instance.currentUser?.verifyBeforeUpdateEmail(email);
    await FirebaseFirestore.instance.collection(BackendEndpoints.getUserData).doc(uid).update({

      'email': email
    });

    // كمان نحدث البيانات داخل الذاكرة


  }


  @override
  Future<String> updatePhoto({required File photoFile}) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("User not logged in");

    // 1. Upload to Firebase Storage
    final ref = FirebaseStorage.instance.ref().child("user_photos/$uid.jpg");
    await ref.putFile(photoFile);

    // 2. Get download URL
    final downloadUrl = await ref.getDownloadURL();

    // 3. Save URL in Firestore
    await FirebaseFirestore.instance
        .collection(BackendEndpoints.getUserData)
        .doc(uid)
        .update({
      'photoUrl': downloadUrl,
    });

    return downloadUrl;
  }

  Future<void> deletePhoto() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("User not logged in");

    // 1. Reference to the photo in Firebase Storage
    final ref = FirebaseStorage.instance.ref().child("user_photos/$uid.jpg");

    // 2. Delete the file from Storage
    await ref.delete();

    // 3. Clear the photoUrl in Firestore
    await FirebaseFirestore.instance
        .collection(BackendEndpoints.getUserData)
        .doc(uid)
        .update({
      'photoUrl': "", // reset to empty string
    });
  }

//   @override Future<void> updateUserName({required String name}) async {
//     final uid = "currentUserId";
//     await firestore.collection("users").doc(uid).update({"name": name}); }
// /// ✅ هنا الـ stream
// @override
// Stream<UserEntity> userStream(String uid) {
//     return firestore.collection("users").doc(uid).snapshots().map( (doc) => UserEntity.fromMap(doc.data()!),
//     );
//   }
}


