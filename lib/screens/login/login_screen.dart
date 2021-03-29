import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllersenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(builder: (_, userManager, __) {
              return ListView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    enabled: !userManager.loading,
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (value) {
                      if (!emailValid(value)) {
                        return "Email invalido";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    enabled: !userManager.loading,
                    controller: _controllersenha,
                    decoration: InputDecoration(
                      hintText: "Senha",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 6)
                        return "senha invalida";
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Esqueci minha senha'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 46,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userManager.signIn(
                                      user: Usuario(
                                        email: _controllerEmail.text,
                                        password: _controllersenha.text,
                                      ),
                                      onFail: (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        // TODO: FECHAR TELA DE LOGIN
                                        print("Foi");
                                      });
                                }
                              },
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: userManager.loading
                            ? CircularProgressIndicator()
                            : Text(
                                "Entrar",
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
