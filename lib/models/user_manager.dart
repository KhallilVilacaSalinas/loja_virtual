import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn(
      {Usuario user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      print(userCredential.user.uid);

      this.user = userCredential.user;
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

  Future<void> _loadCurrentUser() async {
    final User currentUser = await auth.currentUser;
    if (currentUser != null) {
      //Navigator.popAndPushNamed(context, '/home');
      user = currentUser;
      print(user.uid);
    }
    notifyListeners();
  }
}
