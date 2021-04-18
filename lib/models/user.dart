import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  String id;
  String name;
  String email;
  String password;
  String comfirmarSenha;

  Usuario({
    this.id,
    this.name,
    this.email,
    this.password,
    this.comfirmarSenha,
  });

  Usuario.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document.data()['name'] as String;
    email = document.data()['email'] as String;
  }

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
