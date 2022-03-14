import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/Items.dart';

final CollectionPageProvider = ChangeNotifierProvider<CollectionPageModel>(
      (ref) {
    return CollectionPageModel();
  },
);

class CollectionPageModel extends ChangeNotifier {

  List<Items> collectionItems;
  List<Items> items;


  //コレクションデータを全て取得
  Future fetchData (User user) async {

    final uid = user.uid;

    //コレクションを取得
    final QuerySnapshot snapshot =  await
    FirebaseFirestore.instance.collection('collection')
        .where("uid", isEqualTo: uid)
        .orderBy("createdAt", descending: true)
        .get();

    //コレクションのデータをリスト型にする
    final List<Items> items = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String title = data['title'];
      final String describe = data['describe'];
      final String imgURL = data['imgURL'];
      final String docId = data['docId'];
      final String uid = data['uid'];
      final Timestamp createdAt = data['createdAt'];

      return Items(title, describe, imgURL, docId, uid, createdAt);
    }).toList();

    this.collectionItems = items;
    notifyListeners();
  }

  Widget setImage (docs) {
    String doc1;
    String doc2;
    String doc3;


    Widget nullImage (double h, double w) {
      return Container(child: Icon(Icons.add,color: Colors.white,),
          color: Color.fromRGBO(209, 209, 209, 100), height: h, width: w);
    }
    Widget setImage (doc,double h, double w) {
      return Image.network(doc, height: h, width: w, fit: BoxFit.cover);
    }

    switch (docs.length) {
      case 0:
        return Row(children: [
          nullImage(170, 170),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                nullImage(85,170),
                SizedBox(height: 2),
                nullImage(85,170),
              ],
            ),
          ),
        ],);
        break;
      case 1:
        doc1 = docs[0].data()["imgURL"];
        return Row(children: [
          setImage(doc1,170,170),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                nullImage(85,170),
                SizedBox(height: 2),
                nullImage(85,170),
              ],
            ),
          ),
        ],);
        break;
      case 2:
        doc1 = docs[0].data()["imgURL"];
        doc2 = docs[1].data()["imgURL"];
        return Row(children: [
          setImage(doc1,170,170),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                setImage(doc2,85,170),
                SizedBox(height: 2),
                nullImage(85,170),
              ],
            ),
          ),
        ],);
        break;
      default:
        doc1 = docs[0].data()["imgURL"];
        doc2 = docs[1].data()["imgURL"];
        doc3 = docs[2].data()["imgURL"];
        return Row(children: [
          setImage(doc1,170,170),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                setImage(doc2,85,170),
                SizedBox(height: 2),
                setImage(doc3,85,170),
              ],
            ),
          ),
        ],);
        break;
    }
  }
}