import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Usuario usuario;

  bool _loading = false;
  bool get loading => _loading;

  bool get isLoggedIn => usuario != null;

  Future<void> signIn(
      {Usuario user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
              email: user.email, password: user.password);
      print(userCredential.user.uid);

      await _loadCurrentUser(user: userCredential.user);

      user.id = userCredential.user.uid;
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print("Erro:" + e.code);
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  Future<void> signUp(
      {Usuario user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);

      user.id = userCredential.user.uid;
      this.usuario = user;
      await user.saveData();

      onSuccess();
    } on FirebaseAuthException catch (e) {
      print("Erro:" + e.code);
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signOut() {
    auth.signOut();
    usuario = null;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User user}) async {
    final User currentUser = user ?? await auth.currentUser;
    if (currentUser != null) {
      //Navigator.popAndPushNamed(context, '/home');
      final DocumentSnapshot docUser =
          await firestore.collection("users").doc(currentUser.uid).get();
      usuario = Usuario.fromDocument(docUser);
      print(usuario.name);
      notifyListeners();
    }
  }
}
