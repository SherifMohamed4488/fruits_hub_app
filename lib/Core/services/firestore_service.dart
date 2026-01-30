import 'package:cloud_firestore/cloud_firestore.dart';
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

}


