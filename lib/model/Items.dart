import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  Items(this.title,this.describe, this.imgURL, this.docId, this.uid, this.createdAt);

  String title ='';
  String describe ='';
  String imgURL ='';
  String docId ='';
  String uid ='';
  Timestamp createdAt;

}